import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/app/domain/error/failures.dart';

class ThemeSource {
  final String key = 'theme';

  Future<Either<Failure, bool>> getTheme() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      bool? right = pref.getBool(key);
      return Right(right!);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> setTheme() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      bool? data = pref.getBool(key);
      if (data == null) {
        await pref.setBool(key, false);
      }

      return const Right('Set Theme Sucssesflly');
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> updateTheme({required bool isdark}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      await pref.setBool(key, isdark);

      return const Right('Update Theme');
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }
}
