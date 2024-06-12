import 'package:flutter/foundation.dart';

import 'base_service.dart';
import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../apis/api_exception.dart';


class NewsService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2024-06-11&to=2024-06-11&sortBy=popularity&apiKey=16d110fa86e24e7e9d1a9960c0ff4048'));
       debugPrint(">>"+(newsBaseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' ' with status code : ${response.statusCode}');
    }
  }
}