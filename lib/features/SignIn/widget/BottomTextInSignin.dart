
import 'package:chat_app/core/constants/app_string.dart';
import 'package:chat_app/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import '../../sign_up/view/sign_up_screen.dart';

class BottomTextInSignin extends StatelessWidget {
  const BottomTextInSignin({
    super.key, required this.bottomText, required this.nameScreen, required this.screen,
  });
  final String bottomText;
  final String nameScreen;
  final String screen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextWidgets(
            text: bottomText,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,

            ),
          ),

          TextButton(
            onPressed: () {
              Navigator.pushNamed(context,screen );
            },
            child: TextWidgets(text: nameScreen,textStyle: const TextStyle(color: Colors.white,  fontWeight: FontWeight.bold,fontSize: 20),),

          ),

        ],
      ),
    );
  }
}
