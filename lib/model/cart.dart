class CartMode {
  String id;
  String title;
  int count;
  String payPrice;
  String imgUrl;

  CartMode(
      {this.id, this.title, this.count, this.payPrice, this.imgUrl});

  CartMode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    count = json['count'];
    payPrice = json['payPrice'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['count'] = this.count;
    data['payPrice'] = this.payPrice;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}