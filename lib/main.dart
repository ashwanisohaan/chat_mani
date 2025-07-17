import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_design/features/home/home.dart';
import 'package:whatsapp_design/features/verification/welcome.dart';
import 'package:whatsapp_design/routing/app_router.dart';
import 'package:whatsapp_design/core/shared/app_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/firebase_operations/firebase_options.dart';
import 'features/provider/auth_provider.dart';

// import 'features/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: MyApp(),
      ),);}
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



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 2)); // splash delay

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final phoneNumber = prefs.getString('phoneNumber');

    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      context.go(AppRoutes.HOME); // If number exists → go to Home
    } else {
      context.go(AppRoutes.SIGNUP); // Else → go to Signup/Login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(SPL, style: TextStyle(color: Colors.deepPurple, fontSize: 40)),
            Image.asset('assets/images/splash_cht.png'),
          ],
        ),
      ),
    );
  }
}




/*class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        if (auth.isLoading) {
          return Scaffold(body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(SPL,style: TextStyle(color: Colors.deepPurple, fontSize: 40),),
              Image.asset('assets/images/splash_cht.png'),
            ],
          ),
          ),
          );
        } else {
          Future.microtask(() {
            if (auth.isLoggedIn) {
              context.pushReplacement(AppRoutes.HOME);

            } else {
              context.pushReplacement(AppRoutes.SIGNUP);

            }
          });

          // While waiting for Future.microtask to complete
          return Scaffold(
            body: Center(child: Text("Checking login status...")),
          );
        }
      },
    );
  }
}

*/

