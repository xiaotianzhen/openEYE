class FollowCardViewModel {
  final coverUrl;
  final int videoTime;
  final String authorUrl;
  final String description;
  final String title;
  final String videoDescription;
  final String userDescription;
  final String nickName;
  final String playerUrl;
  final String blurredUrl;
  final int videoId;
  final int collectionCount;
  final int shareCount;

  FollowCardViewModel(
      { this.coverUrl,
       this.videoTime,
       this.authorUrl,
       this.description,
       this.title,
       this.videoDescription,
       this.userDescription,
       this.nickName,
       this.playerUrl,
       this.blurredUrl,
       this.videoId,
       this.collectionCount,
       this.shareCount});
}
