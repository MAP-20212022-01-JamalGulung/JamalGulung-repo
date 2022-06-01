class OperationHour {
  final String start;
  final String end;

  OperationHour({required this.start, required this.end});

  OperationHour.fromJson(Map<String, dynamic> parsedJSON)
      : start = parsedJSON['start'],
        end = parsedJSON['end'];
}
