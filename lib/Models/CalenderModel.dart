class CalenderModel {
  int id;
  String title, note;

  CalenderModel(
    this.id,
    this.title,
    this.note,
  );

  CalenderModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.note = map['note'];
  }
}
