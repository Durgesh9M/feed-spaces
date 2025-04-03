class SpacesModel {
  List<Data>? data;
  String? message;
  bool? status;

  SpacesModel({this.data, this.message, this.status});

  SpacesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  List<SpaceGroupData>? spaceGroupData;
  String? spaceGroupName;

  Data({this.spaceGroupData, this.spaceGroupName});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['space_group_data'] != null) {
      spaceGroupData = <SpaceGroupData>[];
      json['space_group_data'].forEach((v) {
        spaceGroupData!.add(new SpaceGroupData.fromJson(v));
      });
    }
    spaceGroupName = json['space_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.spaceGroupData != null) {
      data['space_group_data'] =
          this.spaceGroupData!.map((v) => v.toJson()).toList();
    }
    data['space_group_name'] = this.spaceGroupName;
    return data;
  }
}

class SpaceGroupData {
  int? communityId;
  Null? customEmojiDarkUrl;
  String? customEmojiUrl;
  String? defaultSort;
  String? defaultTab;
  String? displayView;
  String? emoji;
  bool? hideMembersCount;
  bool? hidePostSettings;
  bool? hideSorting;
  int? id;
  bool? isMember;
  bool? isPostDisabled;
  bool? isPrivate;
  String? name;
  Policies? policies;
  String? postType;
  bool? requireTopicSelection;
  bool? showInSpacesSegment;
  bool? showLockIconForNonMembers;
  String? slug;
  int? spaceGroupId;
  String? spaceGroupName;
  String? spaceType;
  int? topicsCount;
  String? url;
  VisibleTabs? visibleTabs;
  int? spaceMemberId;

  SpaceGroupData(
      {this.communityId,
        this.customEmojiDarkUrl,
        this.customEmojiUrl,
        this.defaultSort,
        this.defaultTab,
        this.displayView,
        this.emoji,
        this.hideMembersCount,
        this.hidePostSettings,
        this.hideSorting,
        this.id,
        this.isMember,
        this.isPostDisabled,
        this.isPrivate,
        this.name,
        this.policies,
        this.postType,
        this.requireTopicSelection,
        this.showInSpacesSegment,
        this.showLockIconForNonMembers,
        this.slug,
        this.spaceGroupId,
        this.spaceGroupName,
        this.spaceType,
        this.topicsCount,
        this.url,
        this.visibleTabs,
        this.spaceMemberId});

  SpaceGroupData.fromJson(Map<String, dynamic> json) {
    communityId = json['community_id'];
    customEmojiDarkUrl = json['custom_emoji_dark_url'];
    customEmojiUrl = json['custom_emoji_url'];
    defaultSort = json['default_sort'];
    defaultTab = json['default_tab'];
    displayView = json['display_view'];
    emoji = json['emoji'];
    hideMembersCount = json['hide_members_count'];
    hidePostSettings = json['hide_post_settings'];
    hideSorting = json['hide_sorting'];
    id = json['id'];
    isMember = json['is_member'];
    isPostDisabled = json['is_post_disabled'];
    isPrivate = json['is_private'];
    name = json['name'];
    policies = json['policies'] != null
        ? new Policies.fromJson(json['policies'])
        : null;
    postType = json['post_type'];
    requireTopicSelection = json['require_topic_selection'];
    showInSpacesSegment = json['show_in_spaces_segment'];
    showLockIconForNonMembers = json['show_lock_icon_for_non_members'];
    slug = json['slug'];
    spaceGroupId = json['space_group_id'];
    spaceGroupName = json['space_group_name'];
    spaceType = json['space_type'];
    topicsCount = json['topics_count'];
    url = json['url'];
    visibleTabs = json['visible_tabs'] != null
        ? new VisibleTabs.fromJson(json['visible_tabs'])
        : null;
    spaceMemberId = json['space_member_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['community_id'] = this.communityId;
    data['custom_emoji_dark_url'] = this.customEmojiDarkUrl;
    data['custom_emoji_url'] = this.customEmojiUrl;
    data['default_sort'] = this.defaultSort;
    data['default_tab'] = this.defaultTab;
    data['display_view'] = this.displayView;
    data['emoji'] = this.emoji;
    data['hide_members_count'] = this.hideMembersCount;
    data['hide_post_settings'] = this.hidePostSettings;
    data['hide_sorting'] = this.hideSorting;
    data['id'] = this.id;
    data['is_member'] = this.isMember;
    data['is_post_disabled'] = this.isPostDisabled;
    data['is_private'] = this.isPrivate;
    data['name'] = this.name;
    if (this.policies != null) {
      data['policies'] = this.policies!.toJson();
    }
    data['post_type'] = this.postType;
    data['require_topic_selection'] = this.requireTopicSelection;
    data['show_in_spaces_segment'] = this.showInSpacesSegment;
    data['show_lock_icon_for_non_members'] = this.showLockIconForNonMembers;
    data['slug'] = this.slug;
    data['space_group_id'] = this.spaceGroupId;
    data['space_group_name'] = this.spaceGroupName;
    data['space_type'] = this.spaceType;
    data['topics_count'] = this.topicsCount;
    data['url'] = this.url;
    if (this.visibleTabs != null) {
      data['visible_tabs'] = this.visibleTabs!.toJson();
    }
    data['space_member_id'] = this.spaceMemberId;
    return data;
  }
}

class Policies {
  bool? canCreatePost;
  bool? canInviteMembers;
  bool? canLeaveSpace;
  bool? canManageSpace;
  bool? canViewSpace;

  Policies(
      {this.canCreatePost,
        this.canInviteMembers,
        this.canLeaveSpace,
        this.canManageSpace,
        this.canViewSpace});

  Policies.fromJson(Map<String, dynamic> json) {
    canCreatePost = json['can_create_post'];
    canInviteMembers = json['can_invite_members'];
    canLeaveSpace = json['can_leave_space'];
    canManageSpace = json['can_manage_space'];
    canViewSpace = json['can_view_space'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['can_create_post'] = this.canCreatePost;
    data['can_invite_members'] = this.canInviteMembers;
    data['can_leave_space'] = this.canLeaveSpace;
    data['can_manage_space'] = this.canManageSpace;
    data['can_view_space'] = this.canViewSpace;
    return data;
  }
}

class VisibleTabs {
  bool? members;
  bool? posts;

  VisibleTabs({this.members, this.posts});

  VisibleTabs.fromJson(Map<String, dynamic> json) {
    members = json['members'];
    posts = json['posts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['members'] = this.members;
    data['posts'] = this.posts;
    return data;
  }
}
