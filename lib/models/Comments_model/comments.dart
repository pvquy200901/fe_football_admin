class listComments {
  String? time;
  String? comment;
  String? userComment;

  listComments({this.time, this.comment, this.userComment});

  listComments.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    comment = json['comment'];
    userComment = json['userComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['comment'] = this.comment;
    data['userComment'] = this.userComment;
    return data;
  }
}
