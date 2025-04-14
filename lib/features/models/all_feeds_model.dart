// To parse this JSON data, do
//
//     final allFeedsModel = allFeedsModelFromJson(jsonString);

import 'dart:convert';

AllFeedsModel allFeedsModelFromJson(String str) => AllFeedsModel.fromJson(json.decode(str));

String allFeedsModelToJson(AllFeedsModel data) => json.encode(data.toJson());

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
