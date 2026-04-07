import 'package:chat_app/core/constants/app_images.dart';
import 'package:chat_app/core/constants/app_routes.dart';
import 'package:chat_app/core/constants/app_size_text.dart';
import 'package:chat_app/core/constants/app_string.dart';
import 'package:chat_app/core/widgets/text_widgets.dart';
import 'package:chat_app/features/sign_up/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../core/colors/app_colors.dart';
import '../widget/BottomTextInSignin.dart';
import '../widget/CustomElevatedButton.dart';
import '../widget/TextFormFieldWidget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(80),

                ///  Logo
                Center(
                  child: Image.asset(
                    AppImages.logoImage,
                    height: 100,
                  ),
                ),

                const Gap(10),

                ///  App Name
                Center(
                  child: TextWidgets(
                    text: AppString.appName,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizeText.s35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const Gap(70),

                ///  Sign In Title
                TextWidgets(
                  text: AppString.signinName,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: AppSizeText.s35,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Gap(20),

                ///  Email Field
                TextFormFieldWidget(
                  name: AppString.emailName,
                ),

                const Gap(15),

                /// Password Field
                TextFormFieldWidget(
                  name: AppString.passwordName,
                ),

                const Gap(25),

                ///  Button
                CustomElevatedButton(nameButton: AppString.signinName,),

                const Gap(20),


                BottomTextInSignin(bottomText: AppString.textBottomLoginName, nameScreen: AppString.signupName, screen: AppRoutes.signUp,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
