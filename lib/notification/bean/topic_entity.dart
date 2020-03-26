class TopicEntity {
	bool adExist;
	int total;
	dynamic nextPageUrl;
	int count;
	List<TopicItemlist> itemList;

	TopicEntity({this.adExist, this.total, this.nextPageUrl, this.count, this.itemList});

	TopicEntity.fromJson(Map<String, dynamic> json) {
		adExist = json['adExist'];
		total = json['total'];
		nextPageUrl = json['nextPageUrl'];
		count = json['count'];
		if (json['itemList'] != null) {
			itemList = new List<TopicItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new TopicItemlist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['adExist'] = this.adExist;
		data['total'] = this.total;
		data['nextPageUrl'] = this.nextPageUrl;
		data['count'] = this.count;
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class TopicItemlist {
	TopicItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	TopicItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	TopicItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new TopicItemlistData.fromJson(json['data']) : null;
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

class TopicItemlistData {
	bool ifShowNotificationIcon;
	bool expert;
	String dataType;
	String icon;
	String actionUrl;
	String description;
	bool switchStatus;
	String title;
	TopicItemlistDataFollow follow;
	bool haveReward;
	int uid;
	bool medalIcon;
	dynamic subTitle;
	bool ifNewest;
	String iconType;
	bool ifPgc;
	int id;
	dynamic adTrack;
	dynamic newestEndTime;

	TopicItemlistData({this.ifShowNotificationIcon, this.expert, this.dataType, this.icon, this.actionUrl, this.description, this.switchStatus, this.title, this.follow, this.haveReward, this.uid, this.medalIcon, this.subTitle, this.ifNewest, this.iconType, this.ifPgc, this.id, this.adTrack, this.newestEndTime});

	TopicItemlistData.fromJson(Map<String, dynamic> json) {
		ifShowNotificationIcon = json['ifShowNotificationIcon'];
		expert = json['expert'];
		dataType = json['dataType'];
		icon = json['icon'];
		actionUrl = json['actionUrl'];
		description = json['description'];
		switchStatus = json['switchStatus'];
		title = json['title'];
		follow = json['follow'] != null ? new TopicItemlistDataFollow.fromJson(json['follow']) : null;
		haveReward = json['haveReward'];
		uid = json['uid'];
		medalIcon = json['medalIcon'];
		subTitle = json['subTitle'];
		ifNewest = json['ifNewest'];
		iconType = json['iconType'];
		ifPgc = json['ifPgc'];
		id = json['id'];
		adTrack = json['adTrack'];
		newestEndTime = json['newestEndTime'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ifShowNotificationIcon'] = this.ifShowNotificationIcon;
		data['expert'] = this.expert;
		data['dataType'] = this.dataType;
		data['icon'] = this.icon;
		data['actionUrl'] = this.actionUrl;
		data['description'] = this.description;
		data['switchStatus'] = this.switchStatus;
		data['title'] = this.title;
		if (this.follow != null) {
      data['follow'] = this.follow.toJson();
    }
		data['haveReward'] = this.haveReward;
		data['uid'] = this.uid;
		data['medalIcon'] = this.medalIcon;
		data['subTitle'] = this.subTitle;
		data['ifNewest'] = this.ifNewest;
		data['iconType'] = this.iconType;
		data['ifPgc'] = this.ifPgc;
		data['id'] = this.id;
		data['adTrack'] = this.adTrack;
		data['newestEndTime'] = this.newestEndTime;
		return data;
	}
}

class TopicItemlistDataFollow {
	int itemId;
	String itemType;
	bool followed;

	TopicItemlistDataFollow({this.itemId, this.itemType, this.followed});

	TopicItemlistDataFollow.fromJson(Map<String, dynamic> json) {
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
