class listUser {
  String? name;
  String? phone;
  String? email;
  String? birthday;
  String? username;

  listUser({this.name, this.phone, this.email, this.birthday, this.username});

  listUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    birthday = json['birthday'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['username'] = this.username;
    return data;
  }
}

class infoUser {
  String? name;
  String? avatar;
  String? phone;
  String? email;
  String? birthday;
  String? username;
  bool? chucVu;

  infoUser(
      {this.name,
      this.avatar,
      this.phone,
      this.email,
      this.birthday,
      this.username,
      this.chucVu});

  infoUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    phone = json['phone'];
    email = json['email'];
    birthday = json['birthday'];
    username = json['username'];
    chucVu = json['chucVu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['username'] = this.username;
    data['chucVu'] = this.chucVu;
    return data;
  }
}
