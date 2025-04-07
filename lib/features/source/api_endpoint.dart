class ApiEndpoint {
  static const String baseUrl = "http://13.232.136.97:5002/";
  static const String getSpaces = "$baseUrl/allSpaces";

  static String getSpacesPosts(String slug){
    return "$baseUrl/spaces/$slug/allPost";
  }



}