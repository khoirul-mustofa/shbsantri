class UserModel {
  int? id;
  String? name;
  String? avatar;
  String? email;
  String? password;
  bool? isSubscribed;

  UserModel(
      {this.id,
      this.name,
      this.avatar,
      this.email,
      this.password,
      this.isSubscribed});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    password = json['password'];
    isSubscribed = json['isSubscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['email'] = email;
    data['password'] = password;
    data['isSubscribed'] = isSubscribed;
    return data;
  }
}
