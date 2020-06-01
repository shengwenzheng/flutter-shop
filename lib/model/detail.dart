class Detail {
  String id;
  String imgUrl;
  String title;
  String payPrice;
  String oriPrice;
  String mark;
  String detailHTML;

  Detail(
      {this.id,
      this.imgUrl,
      this.title,
      this.payPrice,
      this.oriPrice,
      this.mark,
      this.detailHTML});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    title = json['title'];
    payPrice = json['payPrice'];
    oriPrice = json['oriPrice'];
    mark = json['mark'];
    detailHTML = json['detailHTML'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['title'] = this.title;
    data['payPrice'] = this.payPrice;
    data['oriPrice'] = this.oriPrice;
    data['mark'] = this.mark;
    data['detailHTML'] = this.detailHTML;
    return data;
  }
}
