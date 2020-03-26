class InteractEntity {
	bool adExist;
	int total;
	String nextPageUrl;
	int count;
	List<InteractItemlist> itemList;

	InteractEntity({this.adExist, this.total, this.nextPageUrl, this.count, this.itemList});

	InteractEntity.fromJson(Map<String, dynamic> json) {
		adExist = json['adExist'];
		total = json['total'];
		nextPageUrl = json['nextPageUrl'];
		count = json['count'];
		if (json['itemList'] != null) {
			itemList = new List<InteractItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new InteractItemlist.fromJson(v)); });
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

class InteractItemlist {
	InteractItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	InteractItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	InteractItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new InteractItemlistData.fromJson(json['data']) : null;
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

class InteractItemlistData {
	bool showHotSign;
	bool ifNewest;
	int joinCount;
	String dataType;
	String imageUrl;
	String actionUrl;
	int id;
	int viewCount;
	String title;
	bool haveReward;
	int newestEndTime;

	InteractItemlistData({this.showHotSign, this.ifNewest, this.joinCount, this.dataType, this.imageUrl, this.actionUrl, this.id, this.viewCount, this.title, this.haveReward, this.newestEndTime});

	InteractItemlistData.fromJson(Map<String, dynamic> json) {
		showHotSign = json['showHotSign'];
		ifNewest = json['ifNewest'];
		joinCount = json['joinCount'];
		dataType = json['dataType'];
		imageUrl = json['imageUrl'];
		actionUrl = json['actionUrl'];
		id = json['id'];
		viewCount = json['viewCount'];
		title = json['title'];
		haveReward = json['haveReward'];
		newestEndTime = json['newestEndTime'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['showHotSign'] = this.showHotSign;
		data['ifNewest'] = this.ifNewest;
		data['joinCount'] = this.joinCount;
		data['dataType'] = this.dataType;
		data['imageUrl'] = this.imageUrl;
		data['actionUrl'] = this.actionUrl;
		data['id'] = this.id;
		data['viewCount'] = this.viewCount;
		data['title'] = this.title;
		data['haveReward'] = this.haveReward;
		data['newestEndTime'] = this.newestEndTime;
		return data;
	}
}
