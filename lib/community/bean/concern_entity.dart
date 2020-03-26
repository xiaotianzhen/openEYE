class ConcernEntity {
	bool adExist;
	int total;
	String nextPageUrl;
	int count;
	List<ConcernItemlist> itemList;

	ConcernEntity({this.adExist, this.total, this.nextPageUrl, this.count, this.itemList});

	ConcernEntity.fromJson(Map<String, dynamic> json) {
		adExist = json['adExist'];
		total = json['total'];
		nextPageUrl = json['nextPageUrl'];
		count = json['count'];
		if (json['itemList'] != null) {
			itemList = new List<ConcernItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new ConcernItemlist.fromJson(v)); });
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

class ConcernItemlist {
	ConcernItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	ConcernItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	ConcernItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ConcernItemlistData.fromJson(json['data']) : null;
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

class ConcernItemlistData {
	String dataType;
	ConcernItemlistDataHeader header;
	ConcernItemlistDataContent content;
	dynamic adTrack;

	ConcernItemlistData({this.dataType, this.header, this.content, this.adTrack});

	ConcernItemlistData.fromJson(Map<String, dynamic> json) {
		dataType = json['dataType'];
		header = json['header'] != null ? new ConcernItemlistDataHeader.fromJson(json['header']) : null;
		content = json['content'] != null ? new ConcernItemlistDataContent.fromJson(json['content']) : null;
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dataType'] = this.dataType;
		if (this.header != null) {
      data['header'] = this.header.toJson();
    }
		if (this.content != null) {
      data['content'] = this.content.toJson();
    }
		data['adTrack'] = this.adTrack;
		return data;
	}
}

class ConcernItemlistDataHeader {
	dynamic labelList;
	int tagId;
	String followType;
	String issuerName;
	String iconType;
	String actionUrl;
	String icon;
	bool showHateVideo;
	int id;
	int time;
	dynamic tagName;
	bool topShow;

	ConcernItemlistDataHeader({this.labelList, this.tagId, this.followType, this.issuerName, this.iconType, this.actionUrl, this.icon, this.showHateVideo, this.id, this.time, this.tagName, this.topShow});

	ConcernItemlistDataHeader.fromJson(Map<String, dynamic> json) {
		labelList = json['labelList'];
		tagId = json['tagId'];
		followType = json['followType'];
		issuerName = json['issuerName'];
		iconType = json['iconType'];
		actionUrl = json['actionUrl'];
		icon = json['icon'];
		showHateVideo = json['showHateVideo'];
		id = json['id'];
		time = json['time'];
		tagName = json['tagName'];
		topShow = json['topShow'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['labelList'] = this.labelList;
		data['tagId'] = this.tagId;
		data['followType'] = this.followType;
		data['issuerName'] = this.issuerName;
		data['iconType'] = this.iconType;
		data['actionUrl'] = this.actionUrl;
		data['icon'] = this.icon;
		data['showHateVideo'] = this.showHateVideo;
		data['id'] = this.id;
		data['time'] = this.time;
		data['tagName'] = this.tagName;
		data['topShow'] = this.topShow;
		return data;
	}
}

class ConcernItemlistDataContent {
	ConcernItemlistDataContentData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	ConcernItemlistDataContent({this.data, this.adIndex, this.tag, this.id, this.type});

	ConcernItemlistDataContent.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ConcernItemlistDataContentData.fromJson(json['data']) : null;
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

class ConcernItemlistDataContentData {
	int date;
	dynamic shareAdTrack;
	int releaseTime;
	dynamic brandWebsiteInfo;
	String description;
	String remark;
	bool collected;
	String title;
	String type;
	dynamic favoriteAdTrack;
	dynamic waterMarks;
	String playUrl;
	ConcernItemlistDataContentDataCover cover;
	int duration;
	String xLibrary;
	String descriptionEditor;
	ConcernItemlistDataContentDataProvider provider;
	int id;
	String descriptionPgc;
	String titlePgc;
	dynamic adTrack;
	List<Null> subtitles;
	bool ad;
	dynamic src;
	ConcernItemlistDataContentDataAuthor author;
	String dataType;
	int searchWeight;
	dynamic playlists;
	ConcernItemlistDataContentDataConsumption consumption;
	bool reallyCollected;
	dynamic label;
	bool played;
	List<ConcernItemlistDataContentDataTag> tags;
	dynamic webAdTrack;
	List<Null> labelList;
	dynamic lastViewTime;
	List<Null> playInfo;
	bool ifLimitVideo;
	ConcernItemlistDataContentDataWeburl webUrl;
	dynamic campaign;
	String category;
	int idx;
	dynamic slogan;
	dynamic thumbPlayUrl;
	String resourceType;
	dynamic promotion;

	ConcernItemlistDataContentData({this.date, this.shareAdTrack, this.releaseTime, this.brandWebsiteInfo, this.description, this.remark, this.collected, this.title, this.type, this.favoriteAdTrack, this.waterMarks, this.playUrl, this.cover, this.duration, this.xLibrary, this.descriptionEditor, this.provider, this.id, this.descriptionPgc, this.titlePgc, this.adTrack, this.subtitles, this.ad, this.src, this.author, this.dataType, this.searchWeight, this.playlists, this.consumption, this.reallyCollected, this.label, this.played, this.tags, this.webAdTrack, this.labelList, this.lastViewTime, this.playInfo, this.ifLimitVideo, this.webUrl, this.campaign, this.category, this.idx, this.slogan, this.thumbPlayUrl, this.resourceType, this.promotion});

	ConcernItemlistDataContentData.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		shareAdTrack = json['shareAdTrack'];
		releaseTime = json['releaseTime'];
		brandWebsiteInfo = json['brandWebsiteInfo'];
		description = json['description'];
		remark = json['remark'];
		collected = json['collected'];
		title = json['title'];
		type = json['type'];
		favoriteAdTrack = json['favoriteAdTrack'];
		waterMarks = json['waterMarks'];
		playUrl = json['playUrl'];
		cover = json['cover'] != null ? new ConcernItemlistDataContentDataCover.fromJson(json['cover']) : null;
		duration = json['duration'];
		xLibrary = json['library'];
		descriptionEditor = json['descriptionEditor'];
		provider = json['provider'] != null ? new ConcernItemlistDataContentDataProvider.fromJson(json['provider']) : null;
		id = json['id'];
		descriptionPgc = json['descriptionPgc'];
		titlePgc = json['titlePgc'];
		adTrack = json['adTrack'];
		if (json['subtitles'] != null) {
			subtitles = new List<Null>();
		}
		ad = json['ad'];
		src = json['src'];
		author = json['author'] != null ? new ConcernItemlistDataContentDataAuthor.fromJson(json['author']) : null;
		dataType = json['dataType'];
		searchWeight = json['searchWeight'];
		playlists = json['playlists'];
		consumption = json['consumption'] != null ? new ConcernItemlistDataContentDataConsumption.fromJson(json['consumption']) : null;
		reallyCollected = json['reallyCollected'];
		label = json['label'];
		played = json['played'];
		if (json['tags'] != null) {
			tags = new List<ConcernItemlistDataContentDataTag>();(json['tags'] as List).forEach((v) { tags.add(new ConcernItemlistDataContentDataTag.fromJson(v)); });
		}
		webAdTrack = json['webAdTrack'];
		if (json['labelList'] != null) {
			labelList = new List<Null>();
		}
		lastViewTime = json['lastViewTime'];
		if (json['playInfo'] != null) {
			playInfo = new List<Null>();
		}
		ifLimitVideo = json['ifLimitVideo'];
		webUrl = json['webUrl'] != null ? new ConcernItemlistDataContentDataWeburl.fromJson(json['webUrl']) : null;
		campaign = json['campaign'];
		category = json['category'];
		idx = json['idx'];
		slogan = json['slogan'];
		thumbPlayUrl = json['thumbPlayUrl'];
		resourceType = json['resourceType'];
		promotion = json['promotion'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['shareAdTrack'] = this.shareAdTrack;
		data['releaseTime'] = this.releaseTime;
		data['brandWebsiteInfo'] = this.brandWebsiteInfo;
		data['description'] = this.description;
		data['remark'] = this.remark;
		data['collected'] = this.collected;
		data['title'] = this.title;
		data['type'] = this.type;
		data['favoriteAdTrack'] = this.favoriteAdTrack;
		data['waterMarks'] = this.waterMarks;
		data['playUrl'] = this.playUrl;
		if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
		data['duration'] = this.duration;
		data['library'] = this.xLibrary;
		data['descriptionEditor'] = this.descriptionEditor;
		if (this.provider != null) {
      data['provider'] = this.provider.toJson();
    }
		data['id'] = this.id;
		data['descriptionPgc'] = this.descriptionPgc;
		data['titlePgc'] = this.titlePgc;
		data['adTrack'] = this.adTrack;
		if (this.subtitles != null) {
      data['subtitles'] =  [];
    }
		data['ad'] = this.ad;
		data['src'] = this.src;
		if (this.author != null) {
      data['author'] = this.author.toJson();
    }
		data['dataType'] = this.dataType;
		data['searchWeight'] = this.searchWeight;
		data['playlists'] = this.playlists;
		if (this.consumption != null) {
      data['consumption'] = this.consumption.toJson();
    }
		data['reallyCollected'] = this.reallyCollected;
		data['label'] = this.label;
		data['played'] = this.played;
		if (this.tags != null) {
      data['tags'] =  this.tags.map((v) => v.toJson()).toList();
    }
		data['webAdTrack'] = this.webAdTrack;
		if (this.labelList != null) {
      data['labelList'] =  [];
    }
		data['lastViewTime'] = this.lastViewTime;
		if (this.playInfo != null) {
      data['playInfo'] =  [];
    }
		data['ifLimitVideo'] = this.ifLimitVideo;
		if (this.webUrl != null) {
      data['webUrl'] = this.webUrl.toJson();
    }
		data['campaign'] = this.campaign;
		data['category'] = this.category;
		data['idx'] = this.idx;
		data['slogan'] = this.slogan;
		data['thumbPlayUrl'] = this.thumbPlayUrl;
		data['resourceType'] = this.resourceType;
		data['promotion'] = this.promotion;
		return data;
	}
}

class ConcernItemlistDataContentDataCover {
	String feed;
	String detail;
	dynamic sharing;
	String blurred;
	dynamic homepage;

	ConcernItemlistDataContentDataCover({this.feed, this.detail, this.sharing, this.blurred, this.homepage});

	ConcernItemlistDataContentDataCover.fromJson(Map<String, dynamic> json) {
		feed = json['feed'];
		detail = json['detail'];
		sharing = json['sharing'];
		blurred = json['blurred'];
		homepage = json['homepage'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['feed'] = this.feed;
		data['detail'] = this.detail;
		data['sharing'] = this.sharing;
		data['blurred'] = this.blurred;
		data['homepage'] = this.homepage;
		return data;
	}
}

class ConcernItemlistDataContentDataProvider {
	String name;
	String icon;
	String alias;

	ConcernItemlistDataContentDataProvider({this.name, this.icon, this.alias});

	ConcernItemlistDataContentDataProvider.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		icon = json['icon'];
		alias = json['alias'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['icon'] = this.icon;
		data['alias'] = this.alias;
		return data;
	}
}

class ConcernItemlistDataContentDataAuthor {
	ConcernItemlistDataContentDataAuthorShield shield;
	bool expert;
	int approvedNotReadyVideoCount;
	String icon;
	String link;
	String description;
	int videoNum;
	ConcernItemlistDataContentDataAuthorFollow follow;
	int recSort;
	String name;
	bool ifPgc;
	int latestReleaseTime;
	int id;
	dynamic adTrack;

	ConcernItemlistDataContentDataAuthor({this.shield, this.expert, this.approvedNotReadyVideoCount, this.icon, this.link, this.description, this.videoNum, this.follow, this.recSort, this.name, this.ifPgc, this.latestReleaseTime, this.id, this.adTrack});

	ConcernItemlistDataContentDataAuthor.fromJson(Map<String, dynamic> json) {
		shield = json['shield'] != null ? new ConcernItemlistDataContentDataAuthorShield.fromJson(json['shield']) : null;
		expert = json['expert'];
		approvedNotReadyVideoCount = json['approvedNotReadyVideoCount'];
		icon = json['icon'];
		link = json['link'];
		description = json['description'];
		videoNum = json['videoNum'];
		follow = json['follow'] != null ? new ConcernItemlistDataContentDataAuthorFollow.fromJson(json['follow']) : null;
		recSort = json['recSort'];
		name = json['name'];
		ifPgc = json['ifPgc'];
		latestReleaseTime = json['latestReleaseTime'];
		id = json['id'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.shield != null) {
      data['shield'] = this.shield.toJson();
    }
		data['expert'] = this.expert;
		data['approvedNotReadyVideoCount'] = this.approvedNotReadyVideoCount;
		data['icon'] = this.icon;
		data['link'] = this.link;
		data['description'] = this.description;
		data['videoNum'] = this.videoNum;
		if (this.follow != null) {
      data['follow'] = this.follow.toJson();
    }
		data['recSort'] = this.recSort;
		data['name'] = this.name;
		data['ifPgc'] = this.ifPgc;
		data['latestReleaseTime'] = this.latestReleaseTime;
		data['id'] = this.id;
		data['adTrack'] = this.adTrack;
		return data;
	}
}

class ConcernItemlistDataContentDataAuthorShield {
	int itemId;
	String itemType;
	bool shielded;

	ConcernItemlistDataContentDataAuthorShield({this.itemId, this.itemType, this.shielded});

	ConcernItemlistDataContentDataAuthorShield.fromJson(Map<String, dynamic> json) {
		itemId = json['itemId'];
		itemType = json['itemType'];
		shielded = json['shielded'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['itemId'] = this.itemId;
		data['itemType'] = this.itemType;
		data['shielded'] = this.shielded;
		return data;
	}
}

class ConcernItemlistDataContentDataAuthorFollow {
	int itemId;
	String itemType;
	bool followed;

	ConcernItemlistDataContentDataAuthorFollow({this.itemId, this.itemType, this.followed});

	ConcernItemlistDataContentDataAuthorFollow.fromJson(Map<String, dynamic> json) {
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

class ConcernItemlistDataContentDataConsumption {
	int shareCount;
	int replyCount;
	int realCollectionCount;
	int collectionCount;

	ConcernItemlistDataContentDataConsumption({this.shareCount, this.replyCount, this.realCollectionCount, this.collectionCount});

	ConcernItemlistDataContentDataConsumption.fromJson(Map<String, dynamic> json) {
		shareCount = json['shareCount'];
		replyCount = json['replyCount'];
		realCollectionCount = json['realCollectionCount'];
		collectionCount = json['collectionCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['shareCount'] = this.shareCount;
		data['replyCount'] = this.replyCount;
		data['realCollectionCount'] = this.realCollectionCount;
		data['collectionCount'] = this.collectionCount;
		return data;
	}
}

class ConcernItemlistDataContentDataTag {
	String actionUrl;
	dynamic childTagList;
	String bgPicture;
	bool haveReward;
	dynamic childTagIdList;
	String tagRecType;
	bool ifNewest;
	String headerImage;
	String name;
	int communityIndex;
	int id;
	dynamic adTrack;
	String desc;
	dynamic newestEndTime;

	ConcernItemlistDataContentDataTag({this.actionUrl, this.childTagList, this.bgPicture, this.haveReward, this.childTagIdList, this.tagRecType, this.ifNewest, this.headerImage, this.name, this.communityIndex, this.id, this.adTrack, this.desc, this.newestEndTime});

	ConcernItemlistDataContentDataTag.fromJson(Map<String, dynamic> json) {
		actionUrl = json['actionUrl'];
		childTagList = json['childTagList'];
		bgPicture = json['bgPicture'];
		haveReward = json['haveReward'];
		childTagIdList = json['childTagIdList'];
		tagRecType = json['tagRecType'];
		ifNewest = json['ifNewest'];
		headerImage = json['headerImage'];
		name = json['name'];
		communityIndex = json['communityIndex'];
		id = json['id'];
		adTrack = json['adTrack'];
		desc = json['desc'];
		newestEndTime = json['newestEndTime'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['actionUrl'] = this.actionUrl;
		data['childTagList'] = this.childTagList;
		data['bgPicture'] = this.bgPicture;
		data['haveReward'] = this.haveReward;
		data['childTagIdList'] = this.childTagIdList;
		data['tagRecType'] = this.tagRecType;
		data['ifNewest'] = this.ifNewest;
		data['headerImage'] = this.headerImage;
		data['name'] = this.name;
		data['communityIndex'] = this.communityIndex;
		data['id'] = this.id;
		data['adTrack'] = this.adTrack;
		data['desc'] = this.desc;
		data['newestEndTime'] = this.newestEndTime;
		return data;
	}
}

class ConcernItemlistDataContentDataWeburl {
	String forWeibo;
	String raw;

	ConcernItemlistDataContentDataWeburl({this.forWeibo, this.raw});

	ConcernItemlistDataContentDataWeburl.fromJson(Map<String, dynamic> json) {
		forWeibo = json['forWeibo'];
		raw = json['raw'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['forWeibo'] = this.forWeibo;
		data['raw'] = this.raw;
		return data;
	}
}
