class TopBannerEntity {
	TopBannerData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	TopBannerEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	TopBannerEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new TopBannerData.fromJson(json['data']) : null;
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

class TopBannerData {
	String dataType;
	int count;
	List<TopBannerDataItemlist> itemList;

	TopBannerData({this.dataType, this.count, this.itemList});

	TopBannerData.fromJson(Map<String, dynamic> json) {
		dataType = json['dataType'];
		count = json['count'];
		if (json['itemList'] != null) {
			itemList = new List<TopBannerDataItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new TopBannerDataItemlist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dataType'] = this.dataType;
		data['count'] = this.count;
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class TopBannerDataItemlist {
	TopBannerDataItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	TopBannerDataItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	TopBannerDataItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new TopBannerDataItemlistData.fromJson(json['data']) : null;
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

class TopBannerDataItemlistData {
	String image;
	List<Null> labelList;
	String dataType;
	String actionUrl;
	bool shade;
	String description;
	TopBannerDataItemlistDataHeader header;
	int id;
	TopBannerDataItemlistDataLabel label;
	String title;
	bool autoPlay;
	List<Null> adTrack;

	TopBannerDataItemlistData({this.image, this.labelList, this.dataType, this.actionUrl, this.shade, this.description, this.header, this.id, this.label, this.title, this.autoPlay, this.adTrack});

	TopBannerDataItemlistData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		if (json['labelList'] != null) {
			labelList = new List<Null>();
		}
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		shade = json['shade'];
		description = json['description'];
		header = json['header'] != null ? new TopBannerDataItemlistDataHeader.fromJson(json['header']) : null;
		id = json['id'];
		label = json['label'] != null ? new TopBannerDataItemlistDataLabel.fromJson(json['label']) : null;
		title = json['title'];
		autoPlay = json['autoPlay'];
		if (json['adTrack'] != null) {
			adTrack = new List<Null>();
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		if (this.labelList != null) {
      data['labelList'] =  [];
    }
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['shade'] = this.shade;
		data['description'] = this.description;
		if (this.header != null) {
      data['header'] = this.header.toJson();
    }
		data['id'] = this.id;
		if (this.label != null) {
      data['label'] = this.label.toJson();
    }
		data['title'] = this.title;
		data['autoPlay'] = this.autoPlay;
		if (this.adTrack != null) {
      data['adTrack'] =  [];
    }
		return data;
	}
}

class TopBannerDataItemlistDataHeader {
	String textAlign;
	dynamic subTitleFont;
	dynamic actionUrl;
	dynamic icon;
	dynamic description;
	dynamic label;
	dynamic title;
	dynamic cover;
	dynamic rightText;
	dynamic labelList;
	dynamic subTitle;
	int id;
	dynamic font;

	TopBannerDataItemlistDataHeader({this.textAlign, this.subTitleFont, this.actionUrl, this.icon, this.description, this.label, this.title, this.cover, this.rightText, this.labelList, this.subTitle, this.id, this.font});

	TopBannerDataItemlistDataHeader.fromJson(Map<String, dynamic> json) {
		textAlign = json['textAlign'];
		subTitleFont = json['subTitleFont'];
		actionUrl = json['actionUrl'];
		icon = json['icon'];
		description = json['description'];
		label = json['label'];
		title = json['title'];
		cover = json['cover'];
		rightText = json['rightText'];
		labelList = json['labelList'];
		subTitle = json['subTitle'];
		id = json['id'];
		font = json['font'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['textAlign'] = this.textAlign;
		data['subTitleFont'] = this.subTitleFont;
		data['actionUrl'] = this.actionUrl;
		data['icon'] = this.icon;
		data['description'] = this.description;
		data['label'] = this.label;
		data['title'] = this.title;
		data['cover'] = this.cover;
		data['rightText'] = this.rightText;
		data['labelList'] = this.labelList;
		data['subTitle'] = this.subTitle;
		data['id'] = this.id;
		data['font'] = this.font;
		return data;
	}
}

class TopBannerDataItemlistDataLabel {
	String text;
	dynamic detail;
	String card;

	TopBannerDataItemlistDataLabel({this.text, this.detail, this.card});

	TopBannerDataItemlistDataLabel.fromJson(Map<String, dynamic> json) {
		text = json['text'];
		detail = json['detail'];
		card = json['card'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['text'] = this.text;
		data['detail'] = this.detail;
		data['card'] = this.card;
		return data;
	}
}
