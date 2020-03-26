class TextCardEntity {
	TextCardData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	TextCardEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	TextCardEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new TextCardData.fromJson(json['data']) : null;
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

class TextCardData {
	dynamic subTitle;
	String dataType;
	String actionUrl;
	int id;
	String text;
	String type;
	dynamic follow;
	dynamic adTrack;

	TextCardData({this.subTitle, this.dataType, this.actionUrl, this.id, this.text, this.type, this.follow, this.adTrack});

	TextCardData.fromJson(Map<String, dynamic> json) {
		subTitle = json['subTitle'];
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		id = json['id'];
		text = json['text'];
		type = json['type'];
		follow = json['follow'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['subTitle'] = this.subTitle;
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['id'] = this.id;
		data['text'] = this.text;
		data['type'] = this.type;
		data['follow'] = this.follow;
		data['adTrack'] = this.adTrack;
		return data;
	}
}
