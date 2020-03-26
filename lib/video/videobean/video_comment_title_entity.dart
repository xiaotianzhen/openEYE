class VideoCommentTitleEntity {
	VideoCommentTitleData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	VideoCommentTitleEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	VideoCommentTitleEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new VideoCommentTitleData.fromJson(json['data']) : null;
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

class VideoCommentTitleData {
	String dataType;
	String actionUrl;
	String text;
	dynamic adTrack;
	String font;

	VideoCommentTitleData({this.dataType, this.actionUrl, this.text, this.adTrack, this.font});

	VideoCommentTitleData.fromJson(Map<String, dynamic> json) {
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		text = json['text'];
		adTrack = json['adTrack'];
		font = json['font'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['text'] = this.text;
		data['adTrack'] = this.adTrack;
		data['font'] = this.font;
		return data;
	}
}
