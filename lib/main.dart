import 'package:whatsapp_design/features/verification/welcome.dart';
import 'package:whatsapp_design/routing/app_router.dart';
import 'package:whatsapp_design/core/shared/app_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/firebase_operations/firebase_options.dart';

// import 'features/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appGoRouterConfig,
      title: SPL,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: HomePage(),

    );
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      context.go(AppRoutes.WELCOME);
    });
    return Scaffold(body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(SPL,style: TextStyle(color: Colors.deepPurple, fontSize: 40),),
      Image.asset('assets/images/splash_cht.png'),
    ],
    ),
    ),
    );
  }
}






/*
    }
}

}
  }
    ),),);
      ],
        Text(SPL,style: TextStyle(color: Colors.white, fontSize: 40),)
        Image.asset('assets/images/splash_cht.png'),
      children: [
      mainAxisAlignment: MainAxisAlignment.center,
      body: Center(child: Column(
      backgroundColor: Colors.deepPurple,
    return  Scaffold(
    goNext(context);
  Widget build(BuildContext context) {
  @override



  }
    });

      context.go('/home');
    Future.delayed(const Duration(seconds: 3),() {
  void goNext(BuildContext context){

  const Splash({super.key});
class Splash extends StatelessWidget {
}
  }

   );
    title: 'ManiChatApp',
      routerConfig: appGoRouterConfig,
      debugShowCheckedModeBanner: false,
    return MaterialApp.router(
  Widget build(BuildContext context) {
  @override
  // This widget is the root of your application.

  const MyApp({super.key});
class MyApp extends StatelessWidget {

}
  runApp(const MyApp());

    await Firebase.initializeApp(); // for Android/iOS

  } else {
    );
      ),
        appId: "YOUR_APP_ID",
        messagingSenderId: "YOUR_SENDER_ID",
        storageBucket: "YOUR_PROJECT.appspot.com",
        projectId: "YOUR_PROJECT_ID",
        authDomain: "YOUR_PROJECT.firebaseapp.com",
        apiKey: "YOUR_API_KEY",
      options: FirebaseOptions(
   await Firebase.initializeApp(

  //if (kIsWeb) {
  WidgetsFlutterBinding.ensureInitialized();
void main() async{

import 'package:whatsapp_design/routing/app_router.dart';
import 'package:whatsapp_design/core/shared/app_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';

    */
