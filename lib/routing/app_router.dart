import "package:go_router/go_router.dart";
import "package:whatsapp_design/features/authlogin/sign_up.dart";
import "package:whatsapp_design/features/authlogin/welcome.dart";
import "package:whatsapp_design/features/home/home.dart";

import "../features/home/chat.dart";
import "../features/home/rigstered_data.dart";
import "../main.dart";

abstract class AppRoutes {
  static const SPLASH = '/';
  static const WELCOME = '/welcome';
  static const CHAT = '/chat';
  static const SIGNUP = '/signup';
  static const HOME = '/home';
  static const LIST = '/list';
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
        // final mobileNo = state.extra as String?;

        return HomePage();
      },
    ),
    GoRoute(
      path: AppRoutes.CHAT,
      builder: (context, state) {
      //  final mobileNo = state.extra as Map<String, dynamic>;
      //  return ChatPage(mobile: mobileNo['mobile']);
        return ChatPage();
      },
    ),
    GoRoute(
      path: AppRoutes.LIST,
      builder: (context, state) => RegisteredUserPage(),
    ),

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
