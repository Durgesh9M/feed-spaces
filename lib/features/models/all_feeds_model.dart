// To parse this JSON data, do
//
//     final allFeedsModel = allFeedsModelFromJson(jsonString);

import 'dart:convert';

AllFeedsModel allFeedsModelFromJson(String str) => AllFeedsModel.fromJson(json.decode(str));

String allFeedsModelToJson(AllFeedsModel data) => json.encode(data.toJson());

// class AllFeedsModel {
//     final Data data;
//     final String message;
//     final bool status;
//
//     AllFeedsModel({
//         required this.data,
//         required this.message,
//         required this.status,
//     });
//
//     factory AllFeedsModel.fromJson(Map<String, dynamic> json) => AllFeedsModel(
//         data: Data.fromJson(json["data"]),
//         message: json["message"],
//         status: json["status"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//         "message": message,
//         "status": status,
//     };
// }
//
// class Data {
//     final int count;
//     final bool hasNextPage;
//     final int page;
//     final int perPage;
//     final List<Record> records;
//     final String sort;
//
//     Data({
//         required this.count,
//         required this.hasNextPage,
//         required this.page,
//         required this.perPage,
//         required this.records,
//         required this.sort,
//     });
//
//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         count: json["count"],
//         hasNextPage: json["has_next_page"],
//         page: json["page"],
//         perPage: json["per_page"],
//         records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
//         sort: json["sort"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "count": count,
//         "has_next_page": hasNextPage,
//         "page": page,
//         "per_page": perPage,
//         "records": List<dynamic>.from(records.map((x) => x.toJson())),
//         "sort": sort,
//     };
// }
//
// class Record {
//     final Action action;
//     final Author author;
//     final RecordBody body;
//     final String bodyPlainText;
//     final String bodyPlainTextWithoutAttachments;
//     final dynamic bookmarkId;
//     final int commentCount;
//     final DateTime createdAt;
//     final dynamic customHtml;
//     final String displayTitle;
//     final String editor;
//     final List<Author> firstLikedBy;
//     final dynamic flaggedForApprovalAt;
//     final bool hideMetaInfo;
//     final int id;
//     final bool isCommentsClosed;
//     final bool isCommentsEnabled;
//     final bool isLiked;
//     final bool isLikingEnabled;
//     final bool isPinnedAtTopOfSpace;
//     final bool isTruncationDisabled;
//     final String name;
//     final Policies policies;
//     final int? postFollowerId;
//     final String postType;
//     final String slug;
//     final Space space;
//     final String spaceType;
//     final String status;
//     final TiptapBody tiptapBody;
//     final int? topicFollowerId;
//     final List<dynamic> topics;
//     final int unresolvedFlaggedReportsCount;
//     final DateTime updatedAt;
//     final String url;
//     final int userLikesCount;
//
//     Record({
//         required this.action,
//         required this.author,
//         required this.body,
//         required this.bodyPlainText,
//         required this.bodyPlainTextWithoutAttachments,
//         required this.bookmarkId,
//         required this.commentCount,
//         required this.createdAt,
//         required this.customHtml,
//         required this.displayTitle,
//         required this.editor,
//         required this.firstLikedBy,
//         required this.flaggedForApprovalAt,
//         required this.hideMetaInfo,
//         required this.id,
//         required this.isCommentsClosed,
//         required this.isCommentsEnabled,
//         required this.isLiked,
//         required this.isLikingEnabled,
//         required this.isPinnedAtTopOfSpace,
//         required this.isTruncationDisabled,
//         required this.name,
//         required this.policies,
//         required this.postFollowerId,
//         required this.postType,
//         required this.slug,
//         required this.space,
//         required this.spaceType,
//         required this.status,
//         required this.tiptapBody,
//         required this.topicFollowerId,
//         required this.topics,
//         required this.unresolvedFlaggedReportsCount,
//         required this.updatedAt,
//         required this.url,
//         required this.userLikesCount,
//     });
//
//     factory Record.fromJson(Map<String, dynamic> json) => Record(
//         action: Action.fromJson(json["action"]),
//         author: Author.fromJson(json["author"]),
//         body: RecordBody.fromJson(json["body"]),
//         bodyPlainText: json["body_plain_text"],
//         bodyPlainTextWithoutAttachments: json["body_plain_text_without_attachments"],
//         bookmarkId: json["bookmark_id"],
//         commentCount: json["comment_count"],
//         createdAt: DateTime.parse(json["created_at"]),
//         customHtml: json["custom_html"],
//         displayTitle: json["display_title"],
//         editor: json["editor"],
//         firstLikedBy: List<Author>.from(json["first_liked_by"].map((x) => Author.fromJson(x))),
//         flaggedForApprovalAt: json["flagged_for_approval_at"],
//         hideMetaInfo: json["hide_meta_info"],
//         id: json["id"],
//         isCommentsClosed: json["is_comments_closed"],
//         isCommentsEnabled: json["is_comments_enabled"],
//         isLiked: json["is_liked"],
//         isLikingEnabled: json["is_liking_enabled"],
//         isPinnedAtTopOfSpace: json["is_pinned_at_top_of_space"],
//         isTruncationDisabled: json["is_truncation_disabled"],
//         name: json["name"],
//         policies: Policies.fromJson(json["policies"]),
//         postFollowerId: json["post_follower_id"],
//         postType: json["post_type"],
//         slug: json["slug"],
//         space: Space.fromJson(json["space"]),
//         spaceType: json["space_type"],
//         status: json["status"],
//         tiptapBody: TiptapBody.fromJson(json["tiptap_body"]),
//         topicFollowerId: json["topic_follower_id"],
//         topics: List<dynamic>.from(json["topics"].map((x) => x)),
//         unresolvedFlaggedReportsCount: json["unresolved_flagged_reports_count"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         url: json["url"],
//         userLikesCount: json["user_likes_count"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "action": action.toJson(),
//         "author": author.toJson(),
//         "body": body.toJson(),
//         "body_plain_text": bodyPlainText,
//         "body_plain_text_without_attachments": bodyPlainTextWithoutAttachments,
//         "bookmark_id": bookmarkId,
//         "comment_count": commentCount,
//         "created_at": createdAt.toIso8601String(),
//         "custom_html": customHtml,
//         "display_title": displayTitle,
//         "editor": editor,
//         "first_liked_by": List<dynamic>.from(firstLikedBy.map((x) => x.toJson())),
//         "flagged_for_approval_at": flaggedForApprovalAt,
//         "hide_meta_info": hideMetaInfo,
//         "id": id,
//         "is_comments_closed": isCommentsClosed,
//         "is_comments_enabled": isCommentsEnabled,
//         "is_liked": isLiked,
//         "is_liking_enabled": isLikingEnabled,
//         "is_pinned_at_top_of_space": isPinnedAtTopOfSpace,
//         "is_truncation_disabled": isTruncationDisabled,
//         "name": name,
//         "policies": policies.toJson(),
//         "post_follower_id": postFollowerId,
//         "post_type": postType,
//         "slug": slug,
//         "space": space.toJson(),
//         "space_type": spaceType,
//         "status": status,
//         "tiptap_body": tiptapBody.toJson(),
//         "topic_follower_id": topicFollowerId,
//         "topics": List<dynamic>.from(topics.map((x) => x)),
//         "unresolved_flagged_reports_count": unresolvedFlaggedReportsCount,
//         "updated_at": updatedAt.toIso8601String(),
//         "url": url,
//         "user_likes_count": userLikesCount,
//     };
// }
//
// class Action {
//     final DateTime createdAt;
//     final String type;
//     final String userName;
//
//     Action({
//         required this.createdAt,
//         required this.type,
//         required this.userName,
//     });
//
//     factory Action.fromJson(Map<String, dynamic> json) => Action(
//         createdAt: DateTime.parse(json["created_at"]),
//         type: json["type"],
//         userName: json["user_name"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "created_at": createdAt.toIso8601String(),
//         "type": type,
//         "user_name": userName,
//     };
// }
//
// class Author {
//     final String? avatarUrl;
//     final int communityMemberId;
//     final String? headline;
//     final int id;
//     final List<MemberTag> memberTags;
//     final String name;
//     final String richTextFieldSgid;
//     final List<String> roles;
//
//     Author({
//         required this.avatarUrl,
//         required this.communityMemberId,
//         required this.headline,
//         required this.id,
//         required this.memberTags,
//         required this.name,
//         required this.richTextFieldSgid,
//         required this.roles,
//     });
//
//     factory Author.fromJson(Map<String, dynamic> json) => Author(
//         avatarUrl: json["avatar_url"],
//         communityMemberId: json["community_member_id"],
//         headline: json["headline"],
//         id: json["id"],
//         memberTags: List<MemberTag>.from(json["member_tags"].map((x) => MemberTag.fromJson(x))),
//         name: json["name"],
//         richTextFieldSgid: json["rich_text_field_sgid"],
//         roles: List<String>.from(json["roles"].map((x) => x)),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "avatar_url": avatarUrl,
//         "community_member_id": communityMemberId,
//         "headline": headline,
//         "id": id,
//         "member_tags": List<dynamic>.from(memberTags.map((x) => x.toJson())),
//         "name": name,
//         "rich_text_field_sgid": richTextFieldSgid,
//         "roles": List<dynamic>.from(roles.map((x) => x)),
//     };
// }
//
// class MemberTag {
//     final String color;
//     final dynamic customEmojiDarkUrl;
//     final dynamic customEmojiUrl;
//     final String displayFormat;
//     final DisplayLocations displayLocations;
//     final String emoji;
//     final int id;
//     final bool isBackgroundEnabled;
//     final bool isPublic;
//     final String name;
//     final String textColor;
//
//     MemberTag({
//         required this.color,
//         required this.customEmojiDarkUrl,
//         required this.customEmojiUrl,
//         required this.displayFormat,
//         required this.displayLocations,
//         required this.emoji,
//         required this.id,
//         required this.isBackgroundEnabled,
//         required this.isPublic,
//         required this.name,
//         required this.textColor,
//     });
//
//     factory MemberTag.fromJson(Map<String, dynamic> json) => MemberTag(
//         color: json["color"],
//         customEmojiDarkUrl: json["custom_emoji_dark_url"],
//         customEmojiUrl: json["custom_emoji_url"],
//         displayFormat: json["display_format"],
//         displayLocations: DisplayLocations.fromJson(json["display_locations"]),
//         emoji: json["emoji"],
//         id: json["id"],
//         isBackgroundEnabled: json["is_background_enabled"],
//         isPublic: json["is_public"],
//         name: json["name"],
//         textColor: json["text_color"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "color": color,
//         "custom_emoji_dark_url": customEmojiDarkUrl,
//         "custom_emoji_url": customEmojiUrl,
//         "display_format": displayFormat,
//         "display_locations": displayLocations.toJson(),
//         "emoji": emoji,
//         "id": id,
//         "is_background_enabled": isBackgroundEnabled,
//         "is_public": isPublic,
//         "name": name,
//         "text_color": textColor,
//     };
// }
//
// class DisplayLocations {
//     final bool memberDirectory;
//     final bool postBio;
//     final bool profilePage;
//
//     DisplayLocations({
//         required this.memberDirectory,
//         required this.postBio,
//         required this.profilePage,
//     });
//
//     factory DisplayLocations.fromJson(Map<String, dynamic> json) => DisplayLocations(
//         memberDirectory: json["member_directory"],
//         postBio: json["post_bio"],
//         profilePage: json["profile_page"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "member_directory": memberDirectory,
//         "post_bio": postBio,
//         "profile_page": profilePage,
//     };
// }
//
// class RecordBody {
//     final Attachments attachments;
//     final List<dynamic> attachmentsArray;
//     final String html;
//
//     RecordBody({
//         required this.attachments,
//         required this.attachmentsArray,
//         required this.html,
//     });
//
//     factory RecordBody.fromJson(Map<String, dynamic> json) => RecordBody(
//         attachments: Attachments.fromJson(json["attachments"]),
//         attachmentsArray: List<dynamic>.from(json["attachments_array"].map((x) => x)),
//         html: json["html"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "attachments": attachments.toJson(),
//         "attachments_array": List<dynamic>.from(attachmentsArray.map((x) => x)),
//         "html": html,
//     };
// }
//
// class Attachments {
//     Attachments();
//
//     factory Attachments.fromJson(Map<String, dynamic> json) => Attachments(
//     );
//
//     Map<String, dynamic> toJson() => {
//     };
// }
//
// class Policies {
//     final bool canDestroyPost;
//     final bool canDuplicatePost;
//     final bool canManagePost;
//     final bool canReportPost;
//     final bool canUpdatePost;
//
//     Policies({
//         required this.canDestroyPost,
//         required this.canDuplicatePost,
//         required this.canManagePost,
//         required this.canReportPost,
//         required this.canUpdatePost,
//     });
//
//     factory Policies.fromJson(Map<String, dynamic> json) => Policies(
//         canDestroyPost: json["can_destroy_post"],
//         canDuplicatePost: json["can_duplicate_post"],
//         canManagePost: json["can_manage_post"],
//         canReportPost: json["can_report_post"],
//         canUpdatePost: json["can_update_post"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "can_destroy_post": canDestroyPost,
//         "can_duplicate_post": canDuplicatePost,
//         "can_manage_post": canManagePost,
//         "can_report_post": canReportPost,
//         "can_update_post": canUpdatePost,
//     };
// }
//
// class Space {
//     final dynamic customEmojiDarkUrl;
//     final String customEmojiUrl;
//     final dynamic emoji;
//     final int id;
//     final String name;
//     final String slug;
//
//     Space({
//         required this.customEmojiDarkUrl,
//         required this.customEmojiUrl,
//         required this.emoji,
//         required this.id,
//         required this.name,
//         required this.slug,
//     });
//
//     factory Space.fromJson(Map<String, dynamic> json) => Space(
//         customEmojiDarkUrl: json["custom_emoji_dark_url"],
//         customEmojiUrl: json["custom_emoji_url"],
//         emoji: json["emoji"],
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "custom_emoji_dark_url": customEmojiDarkUrl,
//         "custom_emoji_url": customEmojiUrl,
//         "emoji": emoji,
//         "id": id,
//         "name": name,
//         "slug": slug,
//     };
// }
//
// class TiptapBody {
//     final List<dynamic> attachments;
//     final TiptapBodyBody body;
//     final String circleIosFallbackText;
//     final List<dynamic> communityMembers;
//     final List<dynamic> entities;
//     final String format;
//     final List<dynamic> groupMentions;
//     final List<InlineAttachment> inlineAttachments;
//     final List<dynamic> polls;
//     final Attachments sgidsToObjectMap;
//
//     TiptapBody({
//         required this.attachments,
//         required this.body,
//         required this.circleIosFallbackText,
//         required this.communityMembers,
//         required this.entities,
//         required this.format,
//         required this.groupMentions,
//         required this.inlineAttachments,
//         required this.polls,
//         required this.sgidsToObjectMap,
//     });
//
//     factory TiptapBody.fromJson(Map<String, dynamic> json) => TiptapBody(
//         attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
//         body: TiptapBodyBody.fromJson(json["body"]),
//         circleIosFallbackText: json["circle_ios_fallback_text"],
//         communityMembers: List<dynamic>.from(json["community_members"].map((x) => x)),
//         entities: List<dynamic>.from(json["entities"].map((x) => x)),
//         format: json["format"],
//         groupMentions: List<dynamic>.from(json["group_mentions"].map((x) => x)),
//         inlineAttachments: List<InlineAttachment>.from(json["inline_attachments"].map((x) => InlineAttachment.fromJson(x))),
//         polls: List<dynamic>.from(json["polls"].map((x) => x)),
//         sgidsToObjectMap: Attachments.fromJson(json["sgids_to_object_map"]),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "attachments": List<dynamic>.from(attachments.map((x) => x)),
//         "body": body.toJson(),
//         "circle_ios_fallback_text": circleIosFallbackText,
//         "community_members": List<dynamic>.from(communityMembers.map((x) => x)),
//         "entities": List<dynamic>.from(entities.map((x) => x)),
//         "format": format,
//         "group_mentions": List<dynamic>.from(groupMentions.map((x) => x)),
//         "inline_attachments": List<dynamic>.from(inlineAttachments.map((x) => x.toJson())),
//         "polls": List<dynamic>.from(polls.map((x) => x)),
//         "sgids_to_object_map": sgidsToObjectMap.toJson(),
//     };
// }
//
// class TiptapBodyBody {
//     final String data;
//     final String message;
//
//     TiptapBodyBody({
//         required this.data,
//         required this.message,
//     });
//
//     factory TiptapBodyBody.fromJson(Map<String, dynamic> json) => TiptapBodyBody(
//         data: json["data"],
//         message: json["message"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "data": data,
//         "message": message,
//     };
// }
//
// class InlineAttachment {
//     final int byteSize;
//     final String contentType;
//     final String filename;
//     final ImageVariants imageVariants;
//     final MediaTranscoding mediaTranscoding;
//     final int mediaTranscriptId;
//     final Metadata metadata;
//     final String signedId;
//     final String type;
//     final String url;
//     final VideoVariants videoVariants;
//     final dynamic webvttFileUrl;
//
//     InlineAttachment({
//         required this.byteSize,
//         required this.contentType,
//         required this.filename,
//         required this.imageVariants,
//         required this.mediaTranscoding,
//         required this.mediaTranscriptId,
//         required this.metadata,
//         required this.signedId,
//         required this.type,
//         required this.url,
//         required this.videoVariants,
//         required this.webvttFileUrl,
//     });
//
//     factory InlineAttachment.fromJson(Map<String, dynamic> json) => InlineAttachment(
//         byteSize: json["byte_size"],
//         contentType: json["content_type"],
//         filename: json["filename"],
//         imageVariants: ImageVariants.fromJson(json["image_variants"]),
//         mediaTranscoding: MediaTranscoding.fromJson(json["media_transcoding"]),
//         mediaTranscriptId: json["media_transcript_id"],
//         metadata: Metadata.fromJson(json["metadata"]),
//         signedId: json["signed_id"],
//         type: json["type"],
//         url: json["url"],
//         videoVariants: VideoVariants.fromJson(json["video_variants"]),
//         webvttFileUrl: json["webvtt_file_url"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "byte_size": byteSize,
//         "content_type": contentType,
//         "filename": filename,
//         "image_variants": imageVariants.toJson(),
//         "media_transcoding": mediaTranscoding.toJson(),
//         "media_transcript_id": mediaTranscriptId,
//         "metadata": metadata.toJson(),
//         "signed_id": signedId,
//         "type": type,
//         "url": url,
//         "video_variants": videoVariants.toJson(),
//         "webvtt_file_url": webvttFileUrl,
//     };
// }
//
// class ImageVariants {
//     final String thumbnail;
//
//     ImageVariants({
//         required this.thumbnail,
//     });
//
//     factory ImageVariants.fromJson(Map<String, dynamic> json) => ImageVariants(
//         thumbnail: json["thumbnail"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "thumbnail": thumbnail,
//     };
// }
//
// class MediaTranscoding {
//     final String status;
//
//     MediaTranscoding({
//         required this.status,
//     });
//
//     factory MediaTranscoding.fromJson(Map<String, dynamic> json) => MediaTranscoding(
//         status: json["status"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "status": status,
//     };
// }
//
// class Metadata {
//     final bool analyzed;
//     final bool audio;
//     final List<int> displayAspectRatio;
//     final double duration;
//     final int height;
//     final bool identified;
//     final bool video;
//     final int width;
//
//     Metadata({
//         required this.analyzed,
//         required this.audio,
//         required this.displayAspectRatio,
//         required this.duration,
//         required this.height,
//         required this.identified,
//         required this.video,
//         required this.width,
//     });
//
//     factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
//         analyzed: json["analyzed"],
//         audio: json["audio"],
//         displayAspectRatio: List<int>.from(json["display_aspect_ratio"].map((x) => x)),
//         duration: json["duration"]?.toDouble(),
//         height: json["height"],
//         identified: json["identified"],
//         video: json["video"],
//         width: json["width"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "analyzed": analyzed,
//         "audio": audio,
//         "display_aspect_ratio": List<dynamic>.from(displayAspectRatio.map((x) => x)),
//         "duration": duration,
//         "height": height,
//         "identified": identified,
//         "video": video,
//         "width": width,
//     };
// }
//
// class VideoVariants {
//     final String hls;
//     final String original;
//
//     VideoVariants({
//         required this.hls,
//         required this.original,
//     });
//
//     factory VideoVariants.fromJson(Map<String, dynamic> json) => VideoVariants(
//         hls: json["hls"],
//         original: json["original"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "hls": hls,
//         "original": original,
//     };
// }
//
// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;
//
//     EnumValues(this.map);
//
//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }

class AllFeedsModel {
    Data? data;
    String? message;
    bool? status;

    AllFeedsModel({this.data, this.message, this.status});

    AllFeedsModel.fromJson(Map<String, dynamic> json) {
        data = json['data'] != null ? new Data.fromJson(json['data']) : null;
        message = json['message'];
        status = json['status'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data!.toJson();
        }
        data['message'] = this.message;
        data['status'] = this.status;
        return data;
    }
}

class Data {
    int? count;
    bool? hasNextPage;
    int? page;
    int? perPage;
    List<Records>? records;
    String? sort;

    Data(
        {this.count,
            this.hasNextPage,
            this.page,
            this.perPage,
            this.records,
            this.sort});

    Data.fromJson(Map<String, dynamic> json) {
        count = json['count'];
        hasNextPage = json['has_next_page'];
        page = json['page'];
        perPage = json['per_page'];
        if (json['records'] != null) {
            records = <Records>[];
            json['records'].forEach((v) {
                records!.add(new Records.fromJson(v));
            });
        }
        sort = json['sort'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['has_next_page'] = this.hasNextPage;
        data['page'] = this.page;
        data['per_page'] = this.perPage;
        if (this.records != null) {
            data['records'] = this.records!.map((v) => v.toJson()).toList();
        }
        data['sort'] = this.sort;
        return data;
    }
}

class Records {
    Action? action;
    Author? author;
    String? bodyPlainText;
    String? bodyPlainTextWithoutAttachments;
    int? commentCount;
    DateTime? createdAt;
    String? displayTitle;
    String? editor;
    bool? hideMetaInfo;
    int? id;
    bool? isCommentsClosed;
    bool? isCommentsEnabled;
    bool? isLiked;
    bool? isLikingEnabled;
    bool? isPinnedAtTopOfSpace;
    bool? isTruncationDisabled;
    String? name;
    String? postType;
    String? slug;
    Space? space;
    String? spaceType;
    String? status;
    TiptapBody? tiptapBody;
    String? updatedAt;
    String? url;
    int? userLikesCount;

    Records(
        {this.action,
            this.author,
            this.bodyPlainText,
            this.bodyPlainTextWithoutAttachments,
            this.commentCount,
            this.createdAt,
            this.displayTitle,
            this.editor,
            this.hideMetaInfo,
            this.id,
            this.isCommentsClosed,
            this.isCommentsEnabled,
            this.isLiked,
            this.isLikingEnabled,
            this.isPinnedAtTopOfSpace,
            this.isTruncationDisabled,
            this.name,
            this.postType,
            this.slug,
            this.space,
            this.spaceType,
            this.status,
            this.tiptapBody,
            this.updatedAt,
            this.url,
            this.userLikesCount});

    Records.fromJson(Map<String, dynamic> json) {
        action =
        json['action'] != null ? new Action.fromJson(json['action']) : null;
        author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
        bodyPlainText = json['body_plain_text'];
        bodyPlainTextWithoutAttachments =
        json['body_plain_text_without_attachments'];
        commentCount = json['comment_count'];
        DateTime.parse(json["created_at"]);
        displayTitle = json['display_title'];
        editor = json['editor'];
        hideMetaInfo = json['hide_meta_info'];
        id = json['id'];
        isCommentsClosed = json['is_comments_closed'];
        isCommentsEnabled = json['is_comments_enabled'];
        isLiked = json['is_liked'];
        isLikingEnabled = json['is_liking_enabled'];
        isPinnedAtTopOfSpace = json['is_pinned_at_top_of_space'];
        isTruncationDisabled = json['is_truncation_disabled'];
        name = json['name'];
        postType = json['post_type'];
        slug = json['slug'];
        space = json['space'] != null ? new Space.fromJson(json['space']) : null;
        spaceType = json['space_type'];
        status = json['status'];
        tiptapBody = json['tiptap_body'] != null
            ? new TiptapBody.fromJson(json['tiptap_body'])
            : null;
        updatedAt = json['updated_at'];
        url = json['url'];
        userLikesCount = json['user_likes_count'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.action != null) {
            data['action'] = this.action!.toJson();
        }
        if (this.author != null) {
            data['author'] = this.author!.toJson();
        }
        data['body_plain_text'] = this.bodyPlainText;
        data['body_plain_text_without_attachments'] =
            this.bodyPlainTextWithoutAttachments;
        data['comment_count'] = this.commentCount;
        data['created_at'] = this.createdAt?.toIso8601String();
        data['display_title'] = this.displayTitle;
        data['editor'] = this.editor;
        data['hide_meta_info'] = this.hideMetaInfo;
        data['id'] = this.id;
        data['is_comments_closed'] = this.isCommentsClosed;
        data['is_comments_enabled'] = this.isCommentsEnabled;
        data['is_liked'] = this.isLiked;
        data['is_liking_enabled'] = this.isLikingEnabled;
        data['is_pinned_at_top_of_space'] = this.isPinnedAtTopOfSpace;
        data['is_truncation_disabled'] = this.isTruncationDisabled;
        data['name'] = this.name;
        data['post_type'] = this.postType;
        data['slug'] = this.slug;
        if (this.space != null) {
            data['space'] = this.space!.toJson();
        }
        data['space_type'] = this.spaceType;
        data['status'] = this.status;
        if (this.tiptapBody != null) {
            data['tiptap_body'] = this.tiptapBody!.toJson();
        }
        data['updated_at'] = this.updatedAt;
        data['url'] = this.url;
        data['user_likes_count'] = this.userLikesCount;
        return data;
    }
}

class Action {
    DateTime? createdAt;
    String? type;
    String? userName;

    Action({this.createdAt, this.type, this.userName});

    Action.fromJson(Map<String, dynamic> json) {
        DateTime.parse(json["created_at"]);
        type = json['type'];
        userName = json['user_name'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.createdAt?.toIso8601String();
        data['type'] = this.type;
        data['user_name'] = this.userName;
        return data;
    }
}

class Author {
    String? avatarUrl;
    int? communityMemberId;
    String? headline;
    int? id;
    List<MemberTags>? memberTags;
    String? name;
    String? richTextFieldSgid;
    List<String>? roles;

    Author(
        {this.avatarUrl,
            this.communityMemberId,
            this.headline,
            this.id,
            this.memberTags,
            this.name,
            this.richTextFieldSgid,
            this.roles});

    Author.fromJson(Map<String, dynamic> json) {
        avatarUrl = json['avatar_url'];
        communityMemberId = json['community_member_id'];
        headline = json['headline'];
        id = json['id'];
        if (json['member_tags'] != null) {
            memberTags = <MemberTags>[];
            json['member_tags'].forEach((v) {
                memberTags!.add(new MemberTags.fromJson(v));
            });
        }
        name = json['name'];
        richTextFieldSgid = json['rich_text_field_sgid'];
        roles = json['roles'].cast<String>();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_url'] = this.avatarUrl;
        data['community_member_id'] = this.communityMemberId;
        data['headline'] = this.headline;
        data['id'] = this.id;
        if (this.memberTags != null) {
            data['member_tags'] = this.memberTags!.map((v) => v.toJson()).toList();
        }
        data['name'] = this.name;
        data['rich_text_field_sgid'] = this.richTextFieldSgid;
        data['roles'] = this.roles;
        return data;
    }
}

class MemberTags {
    String? color;
    dynamic customEmojiDarkUrl;
    dynamic customEmojiUrl;
    String? displayFormat;
    DisplayLocations? displayLocations;
    String? emoji;
    int? id;
    bool? isBackgroundEnabled;
    bool? isPublic;
    String? name;
    String? textColor;

    MemberTags(
        {this.color,
            this.customEmojiDarkUrl,
            this.customEmojiUrl,
            this.displayFormat,
            this.displayLocations,
            this.emoji,
            this.id,
            this.isBackgroundEnabled,
            this.isPublic,
            this.name,
            this.textColor});

    MemberTags.fromJson(Map<String, dynamic> json) {
        color = json['color'];
        customEmojiDarkUrl = json['custom_emoji_dark_url'];
        customEmojiUrl = json['custom_emoji_url'];
        displayFormat = json['display_format'];
        displayLocations = json['display_locations'] != null
            ? new DisplayLocations.fromJson(json['display_locations'])
            : null;
        emoji = json['emoji'];
        id = json['id'];
        isBackgroundEnabled = json['is_background_enabled'];
        isPublic = json['is_public'];
        name = json['name'];
        textColor = json['text_color'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['color'] = this.color;
        data['custom_emoji_dark_url'] = this.customEmojiDarkUrl;
        data['custom_emoji_url'] = this.customEmojiUrl;
        data['display_format'] = this.displayFormat;
        if (this.displayLocations != null) {
            data['display_locations'] = this.displayLocations!.toJson();
        }
        data['emoji'] = this.emoji;
        data['id'] = this.id;
        data['is_background_enabled'] = this.isBackgroundEnabled;
        data['is_public'] = this.isPublic;
        data['name'] = this.name;
        data['text_color'] = this.textColor;
        return data;
    }
}

class DisplayLocations {
    bool? memberDirectory;
    bool? postBio;
    bool? profilePage;

    DisplayLocations({this.memberDirectory, this.postBio, this.profilePage});

    DisplayLocations.fromJson(Map<String, dynamic> json) {
        memberDirectory = json['member_directory'];
        postBio = json['post_bio'];
        profilePage = json['profile_page'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['member_directory'] = this.memberDirectory;
        data['post_bio'] = this.postBio;
        data['profile_page'] = this.profilePage;
        return data;
    }
}

class Space {
    String? emoji;
    int? id;
    String? name;
    String? slug;

    Space({this.emoji, this.id, this.name, this.slug});

    Space.fromJson(Map<String, dynamic> json) {
        emoji = json['emoji'];
        id = json['id'];
        name = json['name'];
        slug = json['slug'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['emoji'] = this.emoji;
        data['id'] = this.id;
        data['name'] = this.name;
        data['slug'] = this.slug;
        return data;
    }
}

class TiptapBody {
    Body? body;
    String? circleIosFallbackText;
    String? format;
    List<CommunityMembers>? communityMembers;

    TiptapBody(
        {this.body,
            this.circleIosFallbackText,
            this.format,
            this.communityMembers});

    TiptapBody.fromJson(Map<String, dynamic> json) {
        body = json['body'] != null ? new Body.fromJson(json['body']) : null;
        circleIosFallbackText = json['circle_ios_fallback_text'];
        format = json['format'];
        if (json['community_members'] != null) {
            communityMembers = <CommunityMembers>[];
            json['community_members'].forEach((v) {
                communityMembers!.add(new CommunityMembers.fromJson(v));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.body != null) {
            data['body'] = this.body!.toJson();
        }
        data['circle_ios_fallback_text'] = this.circleIosFallbackText;
        data['format'] = this.format;
        if (this.communityMembers != null) {
            data['community_members'] =
                this.communityMembers!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Body {
    String? data;
    String? message;

    Body({this.data, this.message});

    Body.fromJson(Map<String, dynamic> json) {
        data = json['data'];
        message = json['message'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['data'] = this.data;
        data['message'] = this.message;
        return data;
    }
}

class CommunityMembers {
    dynamic avatarUrl;
    String? circleIosFallbackText;
    int? id;
    String? name;
    String? publicProfileUrl;
    String? publicUid;
    String? sgid;
    String? type;
    int? userId;

    CommunityMembers(
        {this.avatarUrl,
            this.circleIosFallbackText,
            this.id,
            this.name,
            this.publicProfileUrl,
            this.publicUid,
            this.sgid,
            this.type,
            this.userId});

    CommunityMembers.fromJson(Map<String, dynamic> json) {
        avatarUrl = json['avatar_url'];
        circleIosFallbackText = json['circle_ios_fallback_text'];
        id = json['id'];
        name = json['name'];
        publicProfileUrl = json['public_profile_url'];
        publicUid = json['public_uid'];
        sgid = json['sgid'];
        type = json['type'];
        userId = json['user_id'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_url'] = this.avatarUrl;
        data['circle_ios_fallback_text'] = this.circleIosFallbackText;
        data['id'] = this.id;
        data['name'] = this.name;
        data['public_profile_url'] = this.publicProfileUrl;
        data['public_uid'] = this.publicUid;
        data['sgid'] = this.sgid;
        data['type'] = this.type;
        data['user_id'] = this.userId;
        return data;
    }
}
