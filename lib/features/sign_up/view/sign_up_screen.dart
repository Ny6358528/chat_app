import 'package:chat_app/core/constants/app_images.dart';
import 'package:chat_app/core/constants/app_routes.dart';
import 'package:chat_app/core/constants/app_size_text.dart';
import 'package:chat_app/core/constants/app_string.dart';
import 'package:chat_app/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../core/colors/app_colors.dart';
import '../../SignIn/widget/BottomTextInSignin.dart';
import '../../SignIn/widget/CustomElevatedButton.dart';
import '../../SignIn/widget/TextFormFieldWidget.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
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
                    text: AppString.signupName,
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
                  CustomElevatedButton(nameButton: AppString.signupName,),

                  const Gap(20),


                  BottomTextInSignin(bottomText: AppString.textBottomResName, nameScreen: AppString.signinName, screen: AppRoutes.signIn,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
