class NotesModel {
  int id;
  String title, description;

  NotesModel(this.id, this.title, this.description);

  NotesModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.description = map['description'];
  }
}
