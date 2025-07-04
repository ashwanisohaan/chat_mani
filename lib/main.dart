import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/constant/app_constants.dart';
import 'package:whatsapp_design/routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appGoRouterConfig,
    title: 'ManiChatApp',
    );

  }
}
class Splash extends StatelessWidget {
  const Splash({super.key});

  void goNext(BuildContext context){
    Future.delayed(const Duration(seconds: 3),() {
      context.go('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    goNext(context);
    return  Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/splash_cht.png'),
        Text(SPL,style: TextStyle(color: Colors.white, fontSize: 40),)
      ],
    ),),);
  }
}




