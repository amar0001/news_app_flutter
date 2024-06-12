import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_flutter/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import 'view/login.dart';

void main() {
 
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp( MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewsViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(),
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Login(title: "Login"),
        },
      ),
    );
  }
}