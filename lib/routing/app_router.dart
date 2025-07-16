import "package:go_router/go_router.dart";
import "package:whatsapp_design/features/home/home.dart";
import "package:whatsapp_design/features/verification/sign_up.dart";
import "package:whatsapp_design/features/verification/welcome.dart";

import "../features/home/chat.dart";
import "../main.dart";

abstract class AppRoutes {
  static const SPLASH = '/';
  static const WELCOME = '/welcome';
  static const CHAT = '/chat';
  static const SIGNUP = '/signup';
  static const HOME = '/home';
}

// GoRouter configuration
final appGoRouterConfig = GoRouter(
  initialLocation: AppRoutes.SPLASH,
  routes: [
    GoRoute(
      path: AppRoutes.SPLASH,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.WELCOME,
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(path: AppRoutes.SIGNUP, builder: (context, state) => SignUpPage()),
    GoRoute(
      path: AppRoutes.HOME,
      builder: (context, state) {
          // final mobileNo = state.pathParameters['mobNumber']!;
        final mobileNo = state.extra as String?;

       return HomePage(mobile: mobileNo);
      },
    ),
    GoRoute(path: AppRoutes.CHAT, builder: (context, state) => ChatPage()),

    // GoRoute(
    //   path: '${AppRoutes.screenTaskListing}/:uniqueId',
    //   builder: (context, state) {
    //     var uId = state.pathParameters['uniqueId']!;
    //
    //     return MyList(uniqueId: uId);
    //   },
    // ),
  ],

  debugLogDiagnostics: true,
);
