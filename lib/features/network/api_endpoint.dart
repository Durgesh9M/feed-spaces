class ApiEndpoint {
  static const baseUrl = "https://api.uat.tinkervillage.io";
  static const getFeeds = "$baseUrl/feeds";
  static const String getSpaces = "$baseUrl/allSpaces";

  static String getSpacesPosts(String slug){
    return "$baseUrl/spaces/$slug/allPost";
  }
}
