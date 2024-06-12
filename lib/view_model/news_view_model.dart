import 'package:flutter/cupertino.dart';
import 'package:news_app_flutter/model/apis/api_response.dart';
import 'package:news_app_flutter/model/data/news_list_response.dart';
import 'package:news_app_flutter/model/repository/news_repository.dart';

//https://newsapi.org/
//https://github.com/jitsm555/Flutter-MVVM/blob/master/lib/view/screens/home_screen.dart#L110
//https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958

class NewsViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  NewListResponse? _newListResponse;

  ApiResponse get response {
    return _apiResponse;
  }

  NewListResponse? get newListResponse {
    return _newListResponse;
  }

  /// Call the media service and gets the data of requested media data of
  /// an artist.
  Future<void> fetchNewsData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching news data');
    notifyListeners();
    try {
      List<NewListResponse> newsList = await NewsRepository().fetchNewsList(value);
      _apiResponse = ApiResponse.completed(newsList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void setSelectednews(NewListResponse? newListResponse) {
    _newListResponse = newListResponse;
    notifyListeners();
  }
}