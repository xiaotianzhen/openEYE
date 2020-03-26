class NotificationEntity {
	String nextPageUrl;
	List<NotificationMessagelist> messageList;
	int updateTime;

	NotificationEntity({this.nextPageUrl, this.messageList, this.updateTime});

	NotificationEntity.fromJson(Map<String, dynamic> json) {
		nextPageUrl = json['nextPageUrl'];
		if (json['messageList'] != null) {
			messageList = new List<NotificationMessagelist>();(json['messageList'] as List).forEach((v) { messageList.add(new NotificationMessagelist.fromJson(v)); });
		}
		updateTime = json['updateTime'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nextPageUrl'] = this.nextPageUrl;
		if (this.messageList != null) {
      data['messageList'] =  this.messageList.map((v) => v.toJson()).toList();
    }
		data['updateTime'] = this.updateTime;
		return data;
	}
}

class NotificationMessagelist {
	int date;
	dynamic uid;
	int pushStatus;
	bool viewed;
	bool ifPush;
	String actionUrl;
	String icon;
	int id;
	String title;
	String content;

	NotificationMessagelist({this.date, this.uid, this.pushStatus, this.viewed, this.ifPush, this.actionUrl, this.icon, this.id, this.title, this.content});

	NotificationMessagelist.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		uid = json['uid'];
		pushStatus = json['pushStatus'];
		viewed = json['viewed'];
		ifPush = json['ifPush'];
		actionUrl = json['actionUrl'];
		icon = json['icon'];
		id = json['id'];
		title = json['title'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['uid'] = this.uid;
		data['pushStatus'] = this.pushStatus;
		data['viewed'] = this.viewed;
		data['ifPush'] = this.ifPush;
		data['actionUrl'] = this.actionUrl;
		data['icon'] = this.icon;
		data['id'] = this.id;
		data['title'] = this.title;
		data['content'] = this.content;
		return data;
	}
}
