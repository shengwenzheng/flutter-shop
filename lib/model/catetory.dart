class CategoryModel {
  int code;
  String message;
  List<Result> result;

  CategoryModel({this.code, this.message, this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String picS210;
  String bgPic;
  String color;
  String picS444;
  int count;
  int type;
  List<Content> content;
  String bgColor;
  String webUrl;
  String name;
  String comment;
  String picS192;
  String picS260;

  Result(
      {this.picS210,
      this.bgPic,
      this.color,
      this.picS444,
      this.count,
      this.type,
      this.content,
      this.bgColor,
      this.webUrl,
      this.name,
      this.comment,
      this.picS192,
      this.picS260});

  Result.fromJson(Map<String, dynamic> json) {
    picS210 = json['pic_s210'];
    bgPic = json['bg_pic'];
    color = json['color'];
    picS444 = json['pic_s444'];
    count = json['count'];
    type = json['type'];
    if (json['content'] != null) {
      content = new List<Content>();
      json['content'].forEach((v) {
        content.add(new Content.fromJson(v));
      });
    }
    bgColor = json['bg_color'];
    webUrl = json['web_url'];
    name = json['name'];
    comment = json['comment'];
    picS192 = json['pic_s192'];
    picS260 = json['pic_s260'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic_s210'] = this.picS210;
    data['bg_pic'] = this.bgPic;
    data['color'] = this.color;
    data['pic_s444'] = this.picS444;
    data['count'] = this.count;
    data['type'] = this.type;
    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
    }
    data['bg_color'] = this.bgColor;
    data['web_url'] = this.webUrl;
    data['name'] = this.name;
    data['comment'] = this.comment;
    data['pic_s192'] = this.picS192;
    data['pic_s260'] = this.picS260;
    return data;
  }
}

class Content {
  String allRate;
  String songId;
  String rankChange;
  String biaoshi;
  String author;
  String albumId;
  String picSmall;
  String title;
  String picBig;
  String albumTitle;

  Content(
      {this.allRate,
      this.songId,
      this.rankChange,
      this.biaoshi,
      this.author,
      this.albumId,
      this.picSmall,
      this.title,
      this.picBig,
      this.albumTitle});

  Content.fromJson(Map<String, dynamic> json) {
    allRate = json['all_rate'];
    songId = json['song_id'];
    rankChange = json['rank_change'];
    biaoshi = json['biaoshi'];
    author = json['author'];
    albumId = json['album_id'];
    picSmall = json['pic_small'];
    title = json['title'];
    picBig = json['pic_big'];
    albumTitle = json['album_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_rate'] = this.allRate;
    data['song_id'] = this.songId;
    data['rank_change'] = this.rankChange;
    data['biaoshi'] = this.biaoshi;
    data['author'] = this.author;
    data['album_id'] = this.albumId;
    data['pic_small'] = this.picSmall;
    data['title'] = this.title;
    data['pic_big'] = this.picBig;
    data['album_title'] = this.albumTitle;
    return data;
  }
}
