import 'package:flutter/material.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/presentation/pages/detail_article.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          )),
      title: Text(article.title),
      subtitle: Text(article.author!),
      onTap: () => Navigator.pushNamed(
        context,
        DetailPage.routeName,
        arguments: article,
      ),
    );
  }
}
