class OperationHour {
  String day;
  String start;
  String end;

  OperationHour({this.day = "", this.start = "", this.end = ""});

  Map<String, dynamic> toJson() => {'day': day, 'start': start, 'end': end};

  static OperationHour fromJson(Map<String, dynamic> json) =>
      OperationHour(day: json['day'], start: json['start'], end: json['end']);
}
