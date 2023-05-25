class Datalogin {
  String? id;
  String? username;
  String? firstname;
  String? password;
  String? numberOfPoints;
  String? confidence;

  Datalogin(
      {this.id,
        this.username,
        this.firstname,
        this.password,
        this.numberOfPoints,
        this.confidence});

  Datalogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstname = json['firstname'];
    password = json['password'];
    numberOfPoints = json['numberOfPoints'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['firstname'] = firstname;
    data['password'] = password;
    data['numberOfPoints'] = numberOfPoints;
    data['confidence'] = confidence;
    return data;
  }
}
