import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/presentation/pages/home_pages.dart';

class WelcomePage extends StatefulWidget {
  static String routeName = '/welcome';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
        () => {Navigator.pushReplacementNamed(context, HomePage.routeName)});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 48,
        ),
      ),
    );
  }
}
