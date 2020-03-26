class CategoryEntity {
	CategoryTabinfo tabInfo;

	CategoryEntity({this.tabInfo});

	CategoryEntity.fromJson(Map<String, dynamic> json) {
		tabInfo = json['tabInfo'] != null ? new CategoryTabinfo.fromJson(json['tabInfo']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.tabInfo != null) {
      data['tabInfo'] = this.tabInfo.toJson();
    }
		return data;
	}
}

class CategoryTabinfo {
	List<CategoryTabinfoTablist> tabList;
	int defaultIdx;

	CategoryTabinfo({this.tabList, this.defaultIdx});

	CategoryTabinfo.fromJson(Map<String, dynamic> json) {
		if (json['tabList'] != null) {
			tabList = new List<CategoryTabinfoTablist>();(json['tabList'] as List).forEach((v) { tabList.add(new CategoryTabinfoTablist.fromJson(v)); });
		}
		defaultIdx = json['defaultIdx'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.tabList != null) {
      data['tabList'] =  this.tabList.map((v) => v.toJson()).toList();
    }
		data['defaultIdx'] = this.defaultIdx;
		return data;
	}
}

class CategoryTabinfoTablist {
	int nameType;
	String apiUrl;
	String name;
	int tabType;
	int id;
	dynamic adTrack;

	CategoryTabinfoTablist({this.nameType, this.apiUrl, this.name, this.tabType, this.id, this.adTrack});

	CategoryTabinfoTablist.fromJson(Map<String, dynamic> json) {
		nameType = json['nameType'];
		apiUrl = json['apiUrl'];
		name = json['name'];
		tabType = json['tabType'];
		id = json['id'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nameType'] = this.nameType;
		data['apiUrl'] = this.apiUrl;
		data['name'] = this.name;
		data['tabType'] = this.tabType;
		data['id'] = this.id;
		data['adTrack'] = this.adTrack;
		return data;
	}
}
