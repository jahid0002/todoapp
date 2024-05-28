import 'package:todoapp/app/domain/error/problem.dart';

sealed class Failure {
  final int code;
  final String message;

  const Failure({required this.code, required this.message});

  factory Failure.database({required String message, int code = 0}) =>
      DatabaseFailure(
        code: code,
        message: message,
      );

  factory Failure.server({
    required int code,
    String? message,
    Problem? problem,
  }) =>
      ServerFailure(code: code, message: message, problem: problem);

  @override
  String toString() => message;
}

final class DatabaseFailure extends Failure {
  const DatabaseFailure({super.code = 0, String? message})
      : super(message: message ?? "A database error occurred");
}

class ServerFailure extends Failure {
  final Problem? problem;

  const ServerFailure({
    String? message,
    this.problem,
    required super.code,
  }) : super(message: message ?? "A server error occurred");
}
