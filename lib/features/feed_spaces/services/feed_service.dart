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
}
