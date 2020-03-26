import 'package:open_eye/home/discorverbean/subject_card_entity.dart';
import 'package:open_eye/home/discorverbean/content_banner_entity.dart';
import 'package:open_eye/home/discorverbean/titleview_entity.dart';
import 'package:open_eye/home/discorverbean/top_banner_entity.dart';
import 'package:open_eye/home/discorverbean/category_cart_entity.dart';
import 'package:open_eye/home/discorverbean/briefcard_entity.dart';
import 'package:open_eye/home/nominatebean/nominate_bean_entity.dart';
import 'package:open_eye/home/nominatebean/video_small_card_entity.dart';
import 'package:open_eye/home/nominatebean/follow_card_entity.dart';
import 'package:open_eye/home/nominatebean/text_card_entity.dart';
import 'package:open_eye/video/videobean/video_comment_title_entity.dart';
import 'package:open_eye/video/videobean/video_comment_entity.dart';
import 'package:open_eye/notification/bean/topic_entity.dart';
import 'package:open_eye/notification/bean/interact_entity.dart';
import 'package:open_eye/notification/bean/category_entity.dart';
import 'package:open_eye/notification/bean/notification_entity.dart';
import 'package:open_eye/community/bean/communitycard_entity.dart';
import 'package:open_eye/community/bean/scrollcard_entity.dart';
import 'package:open_eye/community/bean/concern_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "SubjectCardEntity") {
      return SubjectCardEntity.fromJson(json) as T;
    } else if (T.toString() == "ContentBannerEntity") {
      return ContentBannerEntity.fromJson(json) as T;
    } else if (T.toString() == "TitleviewEntity") {
      return TitleviewEntity.fromJson(json) as T;
    } else if (T.toString() == "TopBannerEntity") {
      return TopBannerEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryCartEntity") {
      return CategoryCartEntity.fromJson(json) as T;
    } else if (T.toString() == "BriefcardEntity") {
      return BriefcardEntity.fromJson(json) as T;
    } else if (T.toString() == "NominateBeanEntity") {
      return NominateBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "VideoSmallCardEntity") {
      return VideoSmallCardEntity.fromJson(json) as T;
    } else if (T.toString() == "FollowCardEntity") {
      return FollowCardEntity.fromJson(json) as T;
    } else if (T.toString() == "TextCardEntity") {
      return TextCardEntity.fromJson(json) as T;
    } else if (T.toString() == "VideoCommentTitleEntity") {
      return VideoCommentTitleEntity.fromJson(json) as T;
    } else if (T.toString() == "VideoCommentEntity") {
      return VideoCommentEntity.fromJson(json) as T;
    } else if (T.toString() == "TopicEntity") {
      return TopicEntity.fromJson(json) as T;
    } else if (T.toString() == "InteractEntity") {
      return InteractEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryEntity") {
      return CategoryEntity.fromJson(json) as T;
    } else if (T.toString() == "NotificationEntity") {
      return NotificationEntity.fromJson(json) as T;
    } else if (T.toString() == "CommunitycardEntity") {
      return CommunitycardEntity.fromJson(json) as T;
    } else if (T.toString() == "ScrollcardEntity") {
      return ScrollcardEntity.fromJson(json) as T;
    } else if (T.toString() == "ConcernEntity") {
      return ConcernEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}