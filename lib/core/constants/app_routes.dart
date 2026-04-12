import 'package:chat_app/features/SignIn/view/signIn_screen.dart';
import 'package:chat_app/features/sign_up/view/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../features/chat/pages/chat_screen.dart';

class AppRoutes {

  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String chatScreen = '/chatScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    signIn: (context) => const SignInScreen(),
    signUp: (context) => const SignUpScreen(),
    chatScreen:(context) => const ChatScreen()
  };
}