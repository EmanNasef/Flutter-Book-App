class TasksModel {
  int id;
  String title, subTitle;
  bool state;

  TasksModel(this.id, this.title, this.state, this.subTitle);

  TasksModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.state = map['state'];
    this.subTitle = map['description'];
  }
}
