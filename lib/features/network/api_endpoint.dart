class ApiEndpoint {
  static const baseUrl = "https://api.uat.tinkervillage.io";
  static const getFeeds = "$baseUrl/feeds";
  static const likeFeed = "$baseUrl/feeds/like";
  static const disLikeFeed = "$baseUrl/feeds/unlike";
  static const getCommentsOfFeed = "$baseUrl/comments";
  static const getCommentRepliesOfFeed = "$baseUrl/commentreplies";
  static const String getSpaces = "$baseUrl/allSpaces";

  static String getSpacesPosts(String slug){
    return "$baseUrl/spaces/$slug/allPost";
  }
}
