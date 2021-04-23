class ContactModel {
  int id;
  String name, phone, image;

  ContactModel(this.id, this.name, this.phone, this.image);

  ContactModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.phone = map['phone'];
    this.image = map['imgUrl'];
  }
}
