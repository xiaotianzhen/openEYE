class SubjectCardEntity {
	SubjectCardData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	SubjectCardEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	SubjectCardEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new SubjectCardData.fromJson(json['data']) : null;
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

class SubjectCardData {
	dynamic footer;
	String dataType;
	int count;
	SubjectCardDataHeader header;
	List<SubjectCardDataItemlist> itemList;
	dynamic adTrack;

	SubjectCardData({this.footer, this.dataType, this.count, this.header, this.itemList, this.adTrack});

	SubjectCardData.fromJson(Map<String, dynamic> json) {
		footer = json['footer'];
		dataType = json['dataType'];
		count = json['count'];
		header = json['header'] != null ? new SubjectCardDataHeader.fromJson(json['header']) : null;
		if (json['itemList'] != null) {
			itemList = new List<SubjectCardDataItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new SubjectCardDataItemlist.fromJson(v)); });
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

class SubjectCardDataHeader {
	dynamic cover;
	dynamic rightText;
	dynamic labelList;
	dynamic subTitle;
	String textAlign;
	dynamic subTitleFont;
	dynamic actionUrl;
	int id;
	dynamic label;
	String title;
	String font;

	SubjectCardDataHeader({this.cover, this.rightText, this.labelList, this.subTitle, this.textAlign, this.subTitleFont, this.actionUrl, this.id, this.label, this.title, this.font});

	SubjectCardDataHeader.fromJson(Map<String, dynamic> json) {
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

class SubjectCardDataItemlist {
	SubjectCardDataItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	SubjectCardDataItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	SubjectCardDataItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new SubjectCardDataItemlistData.fromJson(json['data']) : null;
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

class SubjectCardDataItemlistData {
	String image;
	String dataType;
	String actionUrl;
	bool shade;
	String description;
	int id;
	String title;
	dynamic adTrack;

	SubjectCardDataItemlistData({this.image, this.dataType, this.actionUrl, this.shade, this.description, this.id, this.title, this.adTrack});

	SubjectCardDataItemlistData.fromJson(Map<String, dynamic> json) {
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
