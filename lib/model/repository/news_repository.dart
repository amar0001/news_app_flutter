


import 'package:flutter/foundation.dart';
import 'package:news_app_flutter/model/data/news_list_response.dart';
import 'package:news_app_flutter/model/services/base_service.dart';
import 'package:news_app_flutter/model/services/news_service.dart';

class NewsRepository {
  final BaseService _newsService = NewsService();

  Future<List<NewListResponse>> fetchNewsList(String value) async {
  debugPrint(value);

    dynamic response = await _newsService.getResponse(value);
      debugPrint(response);
    // final jsonData = response['results'] as List;
    // List<NewListResponse> newsList =
    //     jsonData.map((tagJson) => NewListResponse.fromJson(tagJson)).toList();
    return List.empty();
  }
}