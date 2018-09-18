class User {
  String name;
  int id;

  User({this.name, this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['login']
    );
  }
}