
import 'package:chat_app/core/constants/app_string.dart';
import 'package:chat_app/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import '../../sign_up/view/sign_up_screen.dart';

class BottomTextInSignin extends StatelessWidget {
  const BottomTextInSignin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextWidgets(
            text: AppString.textBottomLoginName,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,

            ),
          ),

          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return SignUpScreen();
              }));
            },
            child: const
            TextWidgets(text: AppString.signupName,textStyle: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold,fontSize: 20),),

          ),

        ],
      ),
    );
  }
}
