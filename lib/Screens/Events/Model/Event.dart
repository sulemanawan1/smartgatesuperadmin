class Event {
  int? id;
  int? userid;
  String? title;
  String? description;
  String? startdate;
  String? enddate;
  int? active;

  Event({
    required this.id,
    required this.userid,
    required this.title,
    required this.description,
    required this.startdate,
    required this.enddate,
    required this.active,
  });
}
