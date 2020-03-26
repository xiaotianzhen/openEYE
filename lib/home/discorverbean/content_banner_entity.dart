class ContentBannerEntity {
	ContentBannerData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	ContentBannerEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	ContentBannerEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ContentBannerData.fromJson(json['data']) : null;
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

class ContentBannerData {
	String image;
	dynamic labelList;
	String dataType;
	String actionUrl;
	bool shade;
	dynamic description;
	dynamic header;
	int id;
	dynamic label;
	String title;
	bool autoPlay;
	dynamic adTrack;

	ContentBannerData({this.image, this.labelList, this.dataType, this.actionUrl, this.shade, this.description, this.header, this.id, this.label, this.title, this.autoPlay, this.adTrack});

	ContentBannerData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		labelList = json['labelList'];
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		shade = json['shade'];
		description = json['description'];
		header = json['header'];
		id = json['id'];
		label = json['label'];
		title = json['title'];
		autoPlay = json['autoPlay'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['labelList'] = this.labelList;
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['shade'] = this.shade;
		data['description'] = this.description;
		data['header'] = this.header;
		data['id'] = this.id;
		data['label'] = this.label;
		data['title'] = this.title;
		data['autoPlay'] = this.autoPlay;
		data['adTrack'] = this.adTrack;
		return data;
	}
}
