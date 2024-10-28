class notification_all {
  String? title;
  String? date;
  int? id;

  notification_all({this.title, this.date, this.id});

  notification_all.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['id'] = this.id;
    return data;
  }
}
