class CategoryCartEntity {
	CategoryCartData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	CategoryCartEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	CategoryCartEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new CategoryCartData.fromJson(json['data']) : null;
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

class CategoryCartData {
	dynamic footer;
	String dataType;
	int count;
	CategoryCartDataHeader header;
	List<CategoryCartDataItemlist> itemList;
	dynamic adTrack;

	CategoryCartData({this.footer, this.dataType, this.count, this.header, this.itemList, this.adTrack});

	CategoryCartData.fromJson(Map<String, dynamic> json) {
		footer = json['footer'];
		dataType = json['dataType'];
		count = json['count'];
		header = json['header'] != null ? new CategoryCartDataHeader.fromJson(json['header']) : null;
		if (json['itemList'] != null) {
			itemList = new List<CategoryCartDataItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new CategoryCartDataItemlist.fromJson(v)); });
		}
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['footer'] = this.footer;
		data['dataType'] = this.dataType;
		data['count'] = this.count;
		if (this.header != null) {
      data['header'] = this.header.toJson();
    }
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		data['adTrack'] = this.adTrack;
		return data;
	}
}

class CategoryCartDataHeader {
	dynamic cover;
	String rightText;
	dynamic labelList;
	dynamic subTitle;
	String textAlign;
	dynamic subTitleFont;
	String actionUrl;
	int id;
	dynamic label;
	String title;
	String font;

	CategoryCartDataHeader({this.cover, this.rightText, this.labelList, this.subTitle, this.textAlign, this.subTitleFont, this.actionUrl, this.id, this.label, this.title, this.font});

	CategoryCartDataHeader.fromJson(Map<String, dynamic> json) {
		cover = json['cover'];
		rightText = json['rightText'];
		labelList = json['labelList'];
		subTitle = json['subTitle'];
		textAlign = json['textAlign'];
		subTitleFont = json['subTitleFont'];
		actionUrl = json['actionUrl'];
		id = json['id'];
		label = json['label'];
		title = json['title'];
		font = json['font'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cover'] = this.cover;
		data['rightText'] = this.rightText;
		data['labelList'] = this.labelList;
		data['subTitle'] = this.subTitle;
		data['textAlign'] = this.textAlign;
		data['subTitleFont'] = this.subTitleFont;
		data['actionUrl'] = this.actionUrl;
		data['id'] = this.id;
		data['label'] = this.label;
		data['title'] = this.title;
		data['font'] = this.font;
		return data;
	}
}

class CategoryCartDataItemlist {
	CategoryCartDataItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	CategoryCartDataItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	CategoryCartDataItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new CategoryCartDataItemlistData.fromJson(json['data']) : null;
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

class CategoryCartDataItemlistData {
	String image;
	String dataType;
	String actionUrl;
	bool shade;
	dynamic description;
	int id;
	String title;
	dynamic adTrack;

	CategoryCartDataItemlistData({this.image, this.dataType, this.actionUrl, this.shade, this.description, this.id, this.title, this.adTrack});

	CategoryCartDataItemlistData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		shade = json['shade'];
		description = json['description'];
		id = json['id'];
		title = json['title'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['shade'] = this.shade;
		data['description'] = this.description;
		data['id'] = this.id;
		data['title'] = this.title;
		data['adTrack'] = this.adTrack;
		return data;
	}
}
