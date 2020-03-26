class ScrollcardEntity {
	ScrollcardData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	ScrollcardEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	ScrollcardEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ScrollcardData.fromJson(json['data']) : null;
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

class ScrollcardData {
	dynamic footer;
	String dataType;
	int count;
	dynamic header;
	List<ScrollcardDataItemlist> itemList;
	dynamic adTrack;

	ScrollcardData({this.footer, this.dataType, this.count, this.header, this.itemList, this.adTrack});

	ScrollcardData.fromJson(Map<String, dynamic> json) {
		footer = json['footer'];
		dataType = json['dataType'];
		count = json['count'];
		header = json['header'];
		if (json['itemList'] != null) {
			itemList = new List<ScrollcardDataItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new ScrollcardDataItemlist.fromJson(v)); });
		}
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['footer'] = this.footer;
		data['dataType'] = this.dataType;
		data['count'] = this.count;
		data['header'] = this.header;
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		data['adTrack'] = this.adTrack;
		return data;
	}
}

class ScrollcardDataItemlist {
	ScrollcardDataItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	ScrollcardDataItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	ScrollcardDataItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ScrollcardDataItemlistData.fromJson(json['data']) : null;
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

class ScrollcardDataItemlistData {
	String subTitle;
	String dataType;
	String actionUrl;
	String title;
	String bgPicture;

	ScrollcardDataItemlistData({this.subTitle, this.dataType, this.actionUrl, this.title, this.bgPicture});

	ScrollcardDataItemlistData.fromJson(Map<String, dynamic> json) {
		subTitle = json['subTitle'];
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		title = json['title'];
		bgPicture = json['bgPicture'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['subTitle'] = this.subTitle;
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['title'] = this.title;
		data['bgPicture'] = this.bgPicture;
		return data;
	}
}
