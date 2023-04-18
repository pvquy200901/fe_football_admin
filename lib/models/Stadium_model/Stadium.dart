class listStadium {
  String? name;
  String? address;
  String? contact;
  String? latitude;
  String? longtitude;
  int? price;
  List<String>? images;

  listStadium(
      {this.name,
        this.address,
        this.contact,
        this.latitude,
        this.longtitude,
        this.price,
        this.images});

  listStadium.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    latitude = json['latitude'];
    longtitude = json['longtitude'];
    price = json['price'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['latitude'] = this.latitude;
    data['longtitude'] = this.longtitude;
    data['price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}


class infoStadium {
  String? name;
  String? address;
  String? contact;
  int? price;
  List<String>? images;

  infoStadium({this.name, this.address, this.contact, this.price, this.images});

  infoStadium.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    price = json['price'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}

