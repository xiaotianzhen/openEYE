class VideoCommentEntity {
	VideoCommentData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	VideoCommentEntity({this.data, this.adIndex, this.tag, this.id, this.type});

	VideoCommentEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new VideoCommentData.fromJson(json['data']) : null;
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

class VideoCommentData {
	int parentReplyId;
	dynamic ugcVideoId;
	dynamic actionUrl;
	int videoId;
	int likeCount;
	bool showConversationButton;
	bool hot;
	String type;
	bool liked;
	String sid;
	dynamic cover;
	String imageUrl;
	int id;
	bool userBlocked;
	bool showParentReply;
	dynamic ugcVideoUrl;
	dynamic parentReply;
	String dataType;
	String videoTitle;
	String message;
	int sequence;
	int createTime;
	String replyStatus;
	int rootReplyId;
	dynamic userType;
	VideoCommentDataUser user;

	VideoCommentData({this.parentReplyId, this.ugcVideoId, this.actionUrl, this.videoId, this.likeCount, this.showConversationButton, this.hot, this.type, this.liked, this.sid, this.cover, this.imageUrl, this.id, this.userBlocked, this.showParentReply, this.ugcVideoUrl, this.parentReply, this.dataType, this.videoTitle, this.message, this.sequence, this.createTime, this.replyStatus, this.rootReplyId, this.userType, this.user});

	VideoCommentData.fromJson(Map<String, dynamic> json) {
		parentReplyId = json['parentReplyId'];
		ugcVideoId = json['ugcVideoId'];
		actionUrl = json['actionUrl'];
		videoId = json['videoId'];
		likeCount = json['likeCount'];
		showConversationButton = json['showConversationButton'];
		hot = json['hot'];
		type = json['type'];
		liked = json['liked'];
		sid = json['sid'];
		cover = json['cover'];
		imageUrl = json['imageUrl'];
		id = json['id'];
		userBlocked = json['userBlocked'];
		showParentReply = json['showParentReply'];
		ugcVideoUrl = json['ugcVideoUrl'];
		parentReply = json['parentReply'];
		dataType = json['dataType'];
		videoTitle = json['videoTitle'];
		message = json['message'];
		sequence = json['sequence'];
		createTime = json['createTime'];
		replyStatus = json['replyStatus'];
		rootReplyId = json['rootReplyId'];
		userType = json['userType'];
		user = json['user'] != null ? new VideoCommentDataUser.fromJson(json['user']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['parentReplyId'] = this.parentReplyId;
		data['ugcVideoId'] = this.ugcVideoId;
		data['actionUrl'] = this.actionUrl;
		data['videoId'] = this.videoId;
		data['likeCount'] = this.likeCount;
		data['showConversationButton'] = this.showConversationButton;
		data['hot'] = this.hot;
		data['type'] = this.type;
		data['liked'] = this.liked;
		data['sid'] = this.sid;
		data['cover'] = this.cover;
		data['imageUrl'] = this.imageUrl;
		data['id'] = this.id;
		data['userBlocked'] = this.userBlocked;
		data['showParentReply'] = this.showParentReply;
		data['ugcVideoUrl'] = this.ugcVideoUrl;
		data['parentReply'] = this.parentReply;
		data['dataType'] = this.dataType;
		data['videoTitle'] = this.videoTitle;
		data['message'] = this.message;
		data['sequence'] = this.sequence;
		data['createTime'] = this.createTime;
		data['replyStatus'] = this.replyStatus;
		data['rootReplyId'] = this.rootReplyId;
		data['userType'] = this.userType;
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		return data;
	}
}

class VideoCommentDataUser {
	dynamic area;
	int birthday;
	String country;
	bool expert;
	bool limitVideoOpen;
	String gender;
	int releaseDate;
	String city;
	String university;
	String actionUrl;
	String description;
	String avatar;
	bool followed;
	String cover;
	int uid;
	String xLibrary;
	String nickname;
	bool ifPgc;
	String userType;
	String job;
	int registDate;

	VideoCommentDataUser({this.area, this.birthday, this.country, this.expert, this.limitVideoOpen, this.gender, this.releaseDate, this.city, this.university, this.actionUrl, this.description, this.avatar, this.followed, this.cover, this.uid, this.xLibrary, this.nickname, this.ifPgc, this.userType, this.job, this.registDate});

	VideoCommentDataUser.fromJson(Map<String, dynamic> json) {
		area = json['area'];
		birthday = json['birthday'];
		country = json['country'];
		expert = json['expert'];
		limitVideoOpen = json['limitVideoOpen'];
		gender = json['gender'];
		releaseDate = json['releaseDate'];
		city = json['city'];
		university = json['university'];
		actionUrl = json['actionUrl'];
		description = json['description'];
		avatar = json['avatar'];
		followed = json['followed'];
		cover = json['cover'];
		uid = json['uid'];
		xLibrary = json['library'];
		nickname = json['nickname'];
		ifPgc = json['ifPgc'];
		userType = json['userType'];
		job = json['job'];
		registDate = json['registDate'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['area'] = this.area;
		data['birthday'] = this.birthday;
		data['country'] = this.country;
		data['expert'] = this.expert;
		data['limitVideoOpen'] = this.limitVideoOpen;
		data['gender'] = this.gender;
		data['releaseDate'] = this.releaseDate;
		data['city'] = this.city;
		data['university'] = this.university;
		data['actionUrl'] = this.actionUrl;
		data['description'] = this.description;
		data['avatar'] = this.avatar;
		data['followed'] = this.followed;
		data['cover'] = this.cover;
		data['uid'] = this.uid;
		data['library'] = this.xLibrary;
		data['nickname'] = this.nickname;
		data['ifPgc'] = this.ifPgc;
		data['userType'] = this.userType;
		data['job'] = this.job;
		data['registDate'] = this.registDate;
		return data;
	}
}
