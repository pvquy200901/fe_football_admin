class listStadium {
  String? name;
  String? address;
  String? contact;
  int? price;
  List<String>? images;

  listStadium({this.name, this.address, this.contact, this.price, this.images});

  listStadium.fromJson(Map<String, dynamic> json) {
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
