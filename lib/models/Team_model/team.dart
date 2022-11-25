class listTeam {
  String? name;
  String? shortName;
  String? phone;
  String? logo;
  String? des;
  String? address;
  int? quality;
  List<String>? imageTeam;

  listTeam(
      {this.name,
      this.shortName,
      this.phone,
      this.logo,
      this.des,
      this.address,
      this.quality,
      this.imageTeam});

  listTeam.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortName = json['shortName'];
    phone = json['phone'];
    logo = json['logo'];
    des = json['des'];
    address = json['address'];
    quality = json['quality'];
    imageTeam = json['imageTeam'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['phone'] = this.phone;
    data['logo'] = this.logo;
    data['des'] = this.des;
    data['address'] = this.address;
    data['quality'] = this.quality;
    data['imageTeam'] = this.imageTeam;
    return data;
  }
}

