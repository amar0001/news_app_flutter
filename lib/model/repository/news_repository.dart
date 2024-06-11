


import 'package:news_app_flutter/model/data/news_list_response.dart';
import 'package:news_app_flutter/model/services/base_service.dart';
import 'package:news_app_flutter/model/services/news_service.dart';

class NewsRepository {
  BaseService _newsService = NewsService();

  Future<List<NewListResponse>> fetchNewsList(String value) async {
    dynamic response = await _newsService.getResponse(value);
    final jsonData = response['results'] as List;
    List<NewListResponse> newsList =
        jsonData.map((tagJson) => NewListResponse.fromJson(tagJson)).toList();
    return newsList;
  }
}