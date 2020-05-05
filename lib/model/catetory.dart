class CategoryModel {
  List<ItemList> itemList;

  CategoryModel({this.itemList});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = new List<ItemList>();
      json['itemList'].forEach((v) {
        itemList.add(new ItemList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemList != null) {
      data['itemList'] = this.itemList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemList {
  Data data;
  int adIndex;
  Null tag;
  int id;
  String type;

  ItemList({this.data, this.adIndex, this.tag, this.id, this.type});

  ItemList.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    adIndex = json['adIndex'];
    tag = json['tag'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['adIndex'] = this.adIndex;
    data['tag'] = this.tag;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class Data {
  bool ifShowNotificationIcon;
  bool expert;
  String dataType;
  String icon;
  String actionUrl;
  String description;
  String title;
  Follow follow;
  int uid;
  Null subTitle;
  String iconType;
  bool ifPgc;
  int id;
  Null adTrack;

  Data(
      {this.ifShowNotificationIcon,
      this.expert,
      this.dataType,
      this.icon,
      this.actionUrl,
      this.description,
      this.title,
      this.follow,
      this.uid,
      this.subTitle,
      this.iconType,
      this.ifPgc,
      this.id,
      this.adTrack});

  Data.fromJson(Map<String, dynamic> json) {
    ifShowNotificationIcon = json['ifShowNotificationIcon'];
    expert = json['expert'];
    dataType = json['dataType'];
    icon = json['icon'];
    actionUrl = json['actionUrl'];
    description = json['description'];
    title = json['title'];
    follow =
        json['follow'] != null ? new Follow.fromJson(json['follow']) : null;
    uid = json['uid'];
    subTitle = json['subTitle'];
    iconType = json['iconType'];
    ifPgc = json['ifPgc'];
    id = json['id'];
    adTrack = json['adTrack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ifShowNotificationIcon'] = this.ifShowNotificationIcon;
    data['expert'] = this.expert;
    data['dataType'] = this.dataType;
    data['icon'] = this.icon;
    data['actionUrl'] = this.actionUrl;
    data['description'] = this.description;
    data['title'] = this.title;
    if (this.follow != null) {
      data['follow'] = this.follow.toJson();
    }
    data['uid'] = this.uid;
    data['subTitle'] = this.subTitle;
    data['iconType'] = this.iconType;
    data['ifPgc'] = this.ifPgc;
    data['id'] = this.id;
    data['adTrack'] = this.adTrack;
    return data;
  }
}

class Follow {
  int itemId;
  String itemType;
  bool followed;

  Follow({this.itemId, this.itemType, this.followed});

  Follow.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemType = json['itemType'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['itemType'] = this.itemType;
    data['followed'] = this.followed;
    return data;
  }
}
