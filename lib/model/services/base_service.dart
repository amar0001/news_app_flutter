abstract class BaseService {
  final String newsBaseUrl = "https://newsapi.org/v2/";

  Future<dynamic> getResponse(String url);

}