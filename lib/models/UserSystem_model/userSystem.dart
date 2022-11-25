class userSystem {
  String? displayName;
  String? phone;
  String? role;
  String? avatar;

  userSystem({this.displayName, this.phone, this.role, this.avatar});

  userSystem.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    phone = json['phone'];
    role = json['role'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['avatar'] = this.avatar;
    return data;
  }
}
