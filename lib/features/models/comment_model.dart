// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
    final Data data;
    final String message;
    final bool status;

    CommentModel({
        required this.data,
        required this.message,
        required this.status,
    });

    factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
    };
}

class Data {
    final int count;
    final bool hasNextPage;
    final int page;
    final int perPage;
    final List<Record> records;

    Data({
        required this.count,
        required this.hasNextPage,
        required this.page,
        required this.perPage,
        required this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        hasNextPage: json["has_next_page"],
        page: json["page"],
        perPage: json["per_page"],
        records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "has_next_page": hasNextPage,
        "page": page,
        "per_page": perPage,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
    };
}

class Record {
    final Author author;
    final RecordBody body;
    final String bodyText;
    final dynamic bookmarkId;
    final int communityMemberId;
    final DateTime createdAt;
    final String editor;
    final dynamic flaggedForApprovalAt;
    final int id;
    final bool isLiked;
    final dynamic parentCommentId;
    final Policies policies;
    final int postId;
    final String postName;
    final dynamic removedAt;
    final List<Reply> replies;
    final int repliesCount;
    final String showUrl;
    final int spaceId;
    final RecordTiptapBody tiptapBody;
    final int topicId;
    final int unresolvedFlaggedReportsCount;
    final DateTime updatedAt;
    final int userId;
    final int userLikesCount;

    Record({
        required this.author,
        required this.body,
        required this.bodyText,
        required this.bookmarkId,
        required this.communityMemberId,
        required this.createdAt,
        required this.editor,
        required this.flaggedForApprovalAt,
        required this.id,
        required this.isLiked,
        required this.parentCommentId,
        required this.policies,
        required this.postId,
        required this.postName,
        required this.removedAt,
        required this.replies,
        required this.repliesCount,
        required this.showUrl,
        required this.spaceId,
        required this.tiptapBody,
        required this.topicId,
        required this.unresolvedFlaggedReportsCount,
        required this.updatedAt,
        required this.userId,
        required this.userLikesCount,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        author: Author.fromJson(json["author"]),
        body: RecordBody.fromJson(json["body"]),
        bodyText: json["body_text"],
        bookmarkId: json["bookmark_id"],
        communityMemberId: json["community_member_id"],
        createdAt: DateTime.parse(json["created_at"]),
        editor: json["editor"],
        flaggedForApprovalAt: json["flagged_for_approval_at"],
        id: json["id"],
        isLiked: json["is_liked"],
        parentCommentId: json["parent_comment_id"],
        policies: Policies.fromJson(json["policies"]),
        postId: json["post_id"],
        postName: json["post_name"],
        removedAt: json["removed_at"],
        replies: List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))),
        repliesCount: json["replies_count"],
        showUrl: json["show_url"],
        spaceId: json["space_id"],
        tiptapBody: RecordTiptapBody.fromJson(json["tiptap_body"]),
        topicId: json["topic_id"],
        unresolvedFlaggedReportsCount: json["unresolved_flagged_reports_count"],
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        userLikesCount: json["user_likes_count"],
    );

    Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "body": body.toJson(),
        "body_text": bodyText,
        "bookmark_id": bookmarkId,
        "community_member_id": communityMemberId,
        "created_at": createdAt.toIso8601String(),
        "editor": editor,
        "flagged_for_approval_at": flaggedForApprovalAt,
        "id": id,
        "is_liked": isLiked,
        "parent_comment_id": parentCommentId,
        "policies": policies.toJson(),
        "post_id": postId,
        "post_name": postName,
        "removed_at": removedAt,
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "replies_count": repliesCount,
        "show_url": showUrl,
        "space_id": spaceId,
        "tiptap_body": tiptapBody.toJson(),
        "topic_id": topicId,
        "unresolved_flagged_reports_count": unresolvedFlaggedReportsCount,
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "user_likes_count": userLikesCount,
    };
}

class Author {
    final String avatarUrl;
    final int communityMemberId;
    final String? headline;
    final int id;
    final List<dynamic> memberTags;
    final String name;
    final String richTextFieldSgid;
    final List<String> roles;

    Author({
        required this.avatarUrl,
        required this.communityMemberId,
        required this.headline,
        required this.id,
        required this.memberTags,
        required this.name,
        required this.richTextFieldSgid,
        required this.roles,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        avatarUrl: json["avatar_url"],
        communityMemberId: json["community_member_id"],
        headline: json["headline"],
        id: json["id"],
        memberTags: List<dynamic>.from(json["member_tags"].map((x) => x)),
        name: json["name"],
        richTextFieldSgid: json["rich_text_field_sgid"],
        roles: List<String>.from(json["roles"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl,
        "community_member_id": communityMemberId,
        "headline": headline,
        "id": id,
        "member_tags": List<dynamic>.from(memberTags.map((x) => x)),
        "name": name,
        "rich_text_field_sgid": richTextFieldSgid,
        "roles": List<dynamic>.from(roles.map((x) => x)),
    };
}

class RecordBody {
    final Attachments attachments;
    final List<dynamic> attachmentsArray;
    final String html;

    RecordBody({
        required this.attachments,
        required this.attachmentsArray,
        required this.html,
    });

    factory RecordBody.fromJson(Map<String, dynamic> json) => RecordBody(
        attachments: Attachments.fromJson(json["attachments"]),
        attachmentsArray: List<dynamic>.from(json["attachments_array"].map((x) => x)),
        html: json["html"],
    );

    Map<String, dynamic> toJson() => {
        "attachments": attachments.toJson(),
        "attachments_array": List<dynamic>.from(attachmentsArray.map((x) => x)),
        "html": html,
    };
}

class Attachments {
    Attachments();

    factory Attachments.fromJson(Map<String, dynamic> json) => Attachments(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Policies {
    final bool canBookmark;
    final bool canDestroy;
    final bool canEdit;
    final bool canManage;
    final bool canReport;

    Policies({
        required this.canBookmark,
        required this.canDestroy,
        required this.canEdit,
        required this.canManage,
        required this.canReport,
    });

    factory Policies.fromJson(Map<String, dynamic> json) => Policies(
        canBookmark: json["can_bookmark"],
        canDestroy: json["can_destroy"],
        canEdit: json["can_edit"],
        canManage: json["can_manage"],
        canReport: json["can_report"],
    );

    Map<String, dynamic> toJson() => {
        "can_bookmark": canBookmark,
        "can_destroy": canDestroy,
        "can_edit": canEdit,
        "can_manage": canManage,
        "can_report": canReport,
    };
}

class Reply {
    final Author author;
    final RecordBody body;
    final String bodyText;
    final dynamic bookmarkId;
    final int communityMemberId;
    final DateTime createdAt;
    final String editor;
    final dynamic flaggedForApprovalAt;
    final int id;
    final bool isLiked;
    final int parentCommentId;
    final Policies policies;
    final int postId;
    final String postName;
    final dynamic removedAt;
    final int repliesCount;
    final String showUrl;
    final int spaceId;
    final ReplyTiptapBody tiptapBody;
    final int topicId;
    final int unresolvedFlaggedReportsCount;
    final DateTime updatedAt;
    final int userId;
    final int userLikesCount;

    Reply({
        required this.author,
        required this.body,
        required this.bodyText,
        required this.bookmarkId,
        required this.communityMemberId,
        required this.createdAt,
        required this.editor,
        required this.flaggedForApprovalAt,
        required this.id,
        required this.isLiked,
        required this.parentCommentId,
        required this.policies,
        required this.postId,
        required this.postName,
        required this.removedAt,
        required this.repliesCount,
        required this.showUrl,
        required this.spaceId,
        required this.tiptapBody,
        required this.topicId,
        required this.unresolvedFlaggedReportsCount,
        required this.updatedAt,
        required this.userId,
        required this.userLikesCount,
    });

    factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        author: Author.fromJson(json["author"]),
        body: RecordBody.fromJson(json["body"]),
        bodyText: json["body_text"],
        bookmarkId: json["bookmark_id"],
        communityMemberId: json["community_member_id"],
        createdAt: DateTime.parse(json["created_at"]),
        editor: json["editor"],
        flaggedForApprovalAt: json["flagged_for_approval_at"],
        id: json["id"],
        isLiked: json["is_liked"],
        parentCommentId: json["parent_comment_id"],
        policies: Policies.fromJson(json["policies"]),
        postId: json["post_id"],
        postName: json["post_name"],
        removedAt: json["removed_at"],
        repliesCount: json["replies_count"],
        showUrl: json["show_url"],
        spaceId: json["space_id"],
        tiptapBody: ReplyTiptapBody.fromJson(json["tiptap_body"]),
        topicId: json["topic_id"],
        unresolvedFlaggedReportsCount: json["unresolved_flagged_reports_count"],
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        userLikesCount: json["user_likes_count"],
    );

    Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "body": body.toJson(),
        "body_text": bodyText,
        "bookmark_id": bookmarkId,
        "community_member_id": communityMemberId,
        "created_at": createdAt.toIso8601String(),
        "editor": editor,
        "flagged_for_approval_at": flaggedForApprovalAt,
        "id": id,
        "is_liked": isLiked,
        "parent_comment_id": parentCommentId,
        "policies": policies.toJson(),
        "post_id": postId,
        "post_name": postName,
        "removed_at": removedAt,
        "replies_count": repliesCount,
        "show_url": showUrl,
        "space_id": spaceId,
        "tiptap_body": tiptapBody.toJson(),
        "topic_id": topicId,
        "unresolved_flagged_reports_count": unresolvedFlaggedReportsCount,
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "user_likes_count": userLikesCount,
    };
}

class ReplyTiptapBody {
    final List<dynamic> attachments;
    final PurpleBody body;
    final String circleIosFallbackText;
    final List<dynamic> communityMembers;
    final List<dynamic> entities;
    final String format;
    final List<dynamic> groupMentions;
    final List<dynamic> inlineAttachments;
    final List<dynamic> polls;
    final Attachments sgidsToObjectMap;

    ReplyTiptapBody({
        required this.attachments,
        required this.body,
        required this.circleIosFallbackText,
        required this.communityMembers,
        required this.entities,
        required this.format,
        required this.groupMentions,
        required this.inlineAttachments,
        required this.polls,
        required this.sgidsToObjectMap,
    });

    factory ReplyTiptapBody.fromJson(Map<String, dynamic> json) => ReplyTiptapBody(
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        body: PurpleBody.fromJson(json["body"]),
        circleIosFallbackText: json["circle_ios_fallback_text"],
        communityMembers: List<dynamic>.from(json["community_members"].map((x) => x)),
        entities: List<dynamic>.from(json["entities"].map((x) => x)),
        format: json["format"],
        groupMentions: List<dynamic>.from(json["group_mentions"].map((x) => x)),
        inlineAttachments: List<dynamic>.from(json["inline_attachments"].map((x) => x)),
        polls: List<dynamic>.from(json["polls"].map((x) => x)),
        sgidsToObjectMap: Attachments.fromJson(json["sgids_to_object_map"]),
    );

    Map<String, dynamic> toJson() => {
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "body": body.toJson(),
        "circle_ios_fallback_text": circleIosFallbackText,
        "community_members": List<dynamic>.from(communityMembers.map((x) => x)),
        "entities": List<dynamic>.from(entities.map((x) => x)),
        "format": format,
        "group_mentions": List<dynamic>.from(groupMentions.map((x) => x)),
        "inline_attachments": List<dynamic>.from(inlineAttachments.map((x) => x)),
        "polls": List<dynamic>.from(polls.map((x) => x)),
        "sgids_to_object_map": sgidsToObjectMap.toJson(),
    };
}

class PurpleBody {
    final List<BodyContent> content;
    final String type;

    PurpleBody({
        required this.content,
        required this.type,
    });

    factory PurpleBody.fromJson(Map<String, dynamic> json) => PurpleBody(
        content: List<BodyContent>.from(json["content"].map((x) => BodyContent.fromJson(x))),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "type": type,
    };
}

class BodyContent {
    final List<ContentContent> content;
    final String type;

    BodyContent({
        required this.content,
        required this.type,
    });

    factory BodyContent.fromJson(Map<String, dynamic> json) => BodyContent(
        content: List<ContentContent>.from(json["content"].map((x) => ContentContent.fromJson(x))),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "type": type,
    };
}

class ContentContent {
    final String circleIosFallbackText;
    final String text;
    final String type;

    ContentContent({
        required this.circleIosFallbackText,
        required this.text,
        required this.type,
    });

    factory ContentContent.fromJson(Map<String, dynamic> json) => ContentContent(
        circleIosFallbackText: json["circle_ios_fallback_text"],
        text: json["text"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "circle_ios_fallback_text": circleIosFallbackText,
        "text": text,
        "type": type,
    };
}

class RecordTiptapBody {
    final List<dynamic> attachments;
    final FluffyBody body;
    final String circleIosFallbackText;
    final List<dynamic> communityMembers;
    final List<dynamic> entities;
    final String format;
    final List<dynamic> groupMentions;
    final List<dynamic> inlineAttachments;
    final List<dynamic> polls;
    final Attachments sgidsToObjectMap;

    RecordTiptapBody({
        required this.attachments,
        required this.body,
        required this.circleIosFallbackText,
        required this.communityMembers,
        required this.entities,
        required this.format,
        required this.groupMentions,
        required this.inlineAttachments,
        required this.polls,
        required this.sgidsToObjectMap,
    });

    factory RecordTiptapBody.fromJson(Map<String, dynamic> json) => RecordTiptapBody(
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        body: FluffyBody.fromJson(json["body"]),
        circleIosFallbackText: json["circle_ios_fallback_text"],
        communityMembers: List<dynamic>.from(json["community_members"].map((x) => x)),
        entities: List<dynamic>.from(json["entities"].map((x) => x)),
        format: json["format"],
        groupMentions: List<dynamic>.from(json["group_mentions"].map((x) => x)),
        inlineAttachments: List<dynamic>.from(json["inline_attachments"].map((x) => x)),
        polls: List<dynamic>.from(json["polls"].map((x) => x)),
        sgidsToObjectMap: Attachments.fromJson(json["sgids_to_object_map"]),
    );

    Map<String, dynamic> toJson() => {
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "body": body.toJson(),
        "circle_ios_fallback_text": circleIosFallbackText,
        "community_members": List<dynamic>.from(communityMembers.map((x) => x)),
        "entities": List<dynamic>.from(entities.map((x) => x)),
        "format": format,
        "group_mentions": List<dynamic>.from(groupMentions.map((x) => x)),
        "inline_attachments": List<dynamic>.from(inlineAttachments.map((x) => x)),
        "polls": List<dynamic>.from(polls.map((x) => x)),
        "sgids_to_object_map": sgidsToObjectMap.toJson(),
    };
}

class FluffyBody {
    final String data;
    final String message;

    FluffyBody({
        required this.data,
        required this.message,
    });

    factory FluffyBody.fromJson(Map<String, dynamic> json) => FluffyBody(
        data: json["data"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
    };
}
