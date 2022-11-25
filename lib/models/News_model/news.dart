class News {
  String? code;
  String? title;
  String? shortDes;
  String? createdTime;
  String? time;
  String? user;

  News(
      {this.code,
      this.title,
      this.shortDes,
      this.createdTime,
      this.time,
      this.user});

  News.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    shortDes = json['shortDes'];
    createdTime = json['createdTime'];
    time = json['time'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['title'] = this.title;
    data['shortDes'] = this.shortDes;
    data['createdTime'] = this.createdTime;
    data['time'] = this.time;
    data['user'] = this.user;
    return data;
  }
}



class infoNews {
  String? title;
  String? description;
  String? shortDes;
  String? createdTime;
  List<String>? imagesNews;

  infoNews(
      {this.title,
      this.description,
      this.shortDes,
      this.createdTime,
      this.imagesNews});

  infoNews.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    shortDes = json['shortDes'];
    createdTime = json['createdTime'];
    imagesNews = json['imagesNews'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['shortDes'] = this.shortDes;
    data['createdTime'] = this.createdTime;
    data['imagesNews'] = this.imagesNews;
    return data;
  }
}
class NewsV2 {
  String? code;
  String? title;
  String? shortDes;
  String? createdTime;
  String? name;
  String? email;
  String? token;

  NewsV2(
      {this.code,
      this.title,
      this.shortDes,
      this.createdTime,
      this.name,
      this.email,
      this.token});

  NewsV2.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    shortDes = json['shortDes'];
    createdTime = json['createdTime'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['title'] = this.title;
    data['shortDes'] = this.shortDes;
    data['createdTime'] = this.createdTime;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}





