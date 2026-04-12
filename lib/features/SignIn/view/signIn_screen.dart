import 'package:chat_app/core/constants/app_images.dart';
import 'package:chat_app/core/constants/app_routes.dart';
import 'package:chat_app/core/constants/app_size_text.dart';
import 'package:chat_app/core/constants/app_string.dart';
import 'package:chat_app/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/helper/snackBar.dart';
import '../widget/BottomTextInSignin.dart';
import '../widget/CustomElevatedButton.dart';
import '../widget/TextFormFieldWidget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = '';
  String password = '';
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(80),

                    /// Logo
                    Center(
                      child: Image.asset(
                        AppImages.logoImage,
                        height: 100,
                      ),
                    ),

                    const Gap(10),

                    /// App Name
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

                    /// Title
                    TextWidgets(
                      text: AppString.signinName,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizeText.s35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const Gap(20),

                    /// Email
                    TextFormFieldWidget(
                      name: AppString.emailName,
                      onchanged: (data) {
                        email = data;
                      },
                    ),

                    const Gap(15),

                    /// Password
                    TextFormFieldWidget(
                      name: AppString.passwordName,
                      onchanged: (data) {
                        password = data;
                      },
                    ),

                    const Gap(25),

                    /// Button
                    CustomElevatedButton(
                      nameButton: AppString.signinName,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {

                          isLoading = true;
                          setState(() {});

                          try {
                            await loginuser();

                            snackBar(context, 'Login Success');


                             Navigator.pushReplacementNamed(context,AppRoutes.chatScreen,arguments: email);

                          } on FirebaseAuthException catch (e) {

                            if (e.code == 'user-not-found') {
                              snackBar(context, 'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              snackBar(context, 'Wrong password provided.');
                            }

                          } catch (e) {
                            snackBar(context, e.toString());
                          }

                          isLoading = false;
                          setState(() {});
                        }
                      },
                    ),

                    const Gap(20),

                    BottomTextInSignin(
                      bottomText: AppString.textBottomLoginName,
                      nameScreen: AppString.signupName,
                      screen: AppRoutes.signUp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginuser() async {
       await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }


}