import 'dart:convert';

class Problem  {
  final String type;
  final String title;
  final int status;
  final String detail;
  final String traceId;

  Problem({
    required this.type,
    required this.title,
    required this.status,
    required this.detail,
    required this.traceId,
  }); 


  factory Problem.fromMap(Map<String, dynamic> map) {
    return Problem(
      type: map["type"],
      title: map["title"],
      status: map["status"],
      detail: map["detail"],
      traceId: map["traceId"],
    );
  }

  factory Problem.fromJson(String json) => Problem.fromMap(jsonDecode(json)); 


}



