class BriefcardEntity {
	BriefcardData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	BriefcardEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	BriefcardEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new BriefcardData.fromJson(json['data']) : null;
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

class BriefcardData {
	bool ifShowNotificationIcon;
	bool expert;
	String dataType;
	String icon;
	String actionUrl;
	String description;
	String title;
	BriefcardDataFollow follow;
	int uid;
	dynamic subTitle;
	String iconType;
	bool ifPgc;
	int id;
	dynamic adTrack;

	BriefcardData({this.ifShowNotificationIcon, this.expert, this.dataType, this.icon, this.actionUrl, this.description, this.title, this.follow, this.uid, this.subTitle, this.iconType, this.ifPgc, this.id, this.adTrack});

	BriefcardData.fromJson(Map<String, dynamic> json) {
		ifShowNotificationIcon = json['ifShowNotificationIcon'];
		expert = json['expert'];
		dataType = json['dataType'];
		icon = json['icon'];
		actionUrl = json['actionUrl'];
		description = json['description'];
		title = json['title'];
		follow = json['follow'] != null ? new BriefcardDataFollow.fromJson(json['follow']) : null;
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

class BriefcardDataFollow {
	int itemId;
	String itemType;
	bool followed;

	BriefcardDataFollow({this.itemId, this.itemType, this.followed});

	BriefcardDataFollow.fromJson(Map<String, dynamic> json) {
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
