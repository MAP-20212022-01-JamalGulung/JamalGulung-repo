class Book {
  String date;
  String event_desc;
  String event_name;
  String slot;
  String status;
  String uid;

  Book({
    this.date = "",
    this.event_desc = "",
    this.event_name = "",
    this.slot = "",
    this.status = "",
    this.uid = "",
  });

  Map<String, dynamic> toJson() => {
        'date': date,
        'event_desc': event_desc,
        'event_name': event_name,
        'slot': slot,
        'status': status,
        'uid': uid
      };

  static Book fromJson(Map<String, dynamic> json) => Book(
      date: json['date'],
      event_desc: json['event_desc'],
      event_name: json['event_name'],
      slot: json['slot'],
      status: json['status'],
      uid: json['uid']);
}
