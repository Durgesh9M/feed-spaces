// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:feed_spaces/features/models/all_feeds_model.dart';
import 'package:feed_spaces/features/network/api_endpoint.dart';
import 'package:feed_spaces/features/network/api_service.dart';

class FeedService {
  static Future<AllFeedsModel?> getFeeds() async {
    try {
      final response = await ApiService().getData(url: ApiEndpoint.getFeeds);

      if (response == null) return null;

      return AllFeedsModel.fromJson(response);
    } catch (e) {
      print('Error fetching feeds: $e');
      return null;
    }
  }

  static Future<bool> feedLiked(Map<String, dynamic> body, int postId) async {
    try {
      final Map<String, dynamic>? responseData = await ApiService()
          .postData(url: "${ApiEndpoint.likeFeed}/$postId", params: body);
      print("Response Data ==>$responseData");
      // Check for a success indicator in the returned Map.
      if (responseData != null && responseData['status'] == 200) {
        print("Post liked successfully");
        return true;
      }
    } catch (e) {
      print('Error Liking feeds: $e');
      return false;
    }
    return false;
  }

static Future<bool> feedDisliked(int postId) async {
  try {
      final Map<String, dynamic>? responseData = await ApiService()
          .deleteData(url: "${ApiEndpoint.disLikeFeed}/$postId");
      print("Response Data ==>$responseData");
      // Check for a success indicator in the returned Map.
      if (responseData != null && responseData['status'] == 200) {
        print("Post Disliked successfully");
        return true;
      }
    } catch (e) {
      print('Error Liking feeds: $e');
      return false;
    }
    return false;
}

}
