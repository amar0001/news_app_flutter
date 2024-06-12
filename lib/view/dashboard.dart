
import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/apis/api_response.dart';
import 'package:news_app_flutter/view_model/news_view_model.dart';
import 'package:provider/provider.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  State<Dashboard> createState() => DashboardState();

}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
       Provider.of<NewsViewModel>(context, listen: false)
                                .fetchNewsData('everything?q=tesla&from=2024-05-12&sortBy=publishedAt&apiKey=16d110fa86e24e7e9d1a9960c0ff4048');

    // ApiResponse apiResponse = Provider.of<NewsViewModel>(context).response;

     //print(apiResponse);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          'Hello World',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}