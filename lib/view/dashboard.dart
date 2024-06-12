
import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/apis/api_response.dart';
import 'package:news_app_flutter/model/data/articles.dart';
import 'package:news_app_flutter/model/data/news_list_response.dart';
import 'package:news_app_flutter/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  State<Dashboard> createState() => DashboardState();

}

class DashboardState extends State<Dashboard> {


 List<Articles>? _newsList ;


 @override
  void initState() {
    super.initState();
   
   
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchNewsData();
    });
  }

  Future<void> fetchNewsData() async {


final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2024-06-11&to=2024-06-11&sortBy=popularity&apiKey=16d110fa86e24e7e9d1a9960c0ff4048'));
    if (response.statusCode == 200) {
       
      final jsonData = json.decode(response.body)['articles'];
  
      setState(() {
     _newsList = jsonData.map<Articles>((json) => Articles.fromJson(json)).toList();

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _newsList != null
          ? ListView.builder(
              itemCount: _newsList!.length,
              itemBuilder: (context, index) {
    
                return ListTile(
                  title: Text("${_newsList![index].title}"),
                  subtitle: Text("${_newsList![index].description}")
                ); 
              },
            )
          :  const Center(
              child: Text(
                'No News',
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}

