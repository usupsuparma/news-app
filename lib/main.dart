import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/presentation/pages/article_webview.dart';
import 'package:news_app/presentation/pages/detail_article.dart';
import 'package:news_app/presentation/pages/home_pages.dart';
import 'package:news_app/presentation/pages/welcome_page.dart';
import 'package:news_app/presentation/provider/news_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => NewsProvider(apiService: ApiService()))
      ],
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: WelcomePage.routeName,
        routes: {
          WelcomePage.routeName: (context) => WelcomePage(
                key: UniqueKey(),
              ),
          HomePage.routeName: (context) => HomePage(
                key: UniqueKey(),
              ),
          DetailPage.routeName: (context) => DetailPage(
              key: UniqueKey(),
              article: ModalRoute.of(context)?.settings.arguments as Article),
          ArticleWebview.routeName: (context) => ArticleWebview(
              url: ModalRoute.of(context)?.settings.arguments as String)
        },
      ),
    );
  }
}
