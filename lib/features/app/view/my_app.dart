import 'package:chat_app/core/constants/app_routes.dart';
import 'package:chat_app/features/SignIn/view/signIn_screen.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.signIn,
      home: SignInScreen(),
    );
  }
}
