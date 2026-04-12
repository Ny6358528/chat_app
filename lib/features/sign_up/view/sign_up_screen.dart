import 'package:chat_app/core/constants/app_images.dart';
import 'package:chat_app/core/constants/app_routes.dart';
import 'package:chat_app/core/constants/app_size_text.dart';
import 'package:chat_app/core/constants/app_string.dart';
import 'package:chat_app/core/widgets/text_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/helper/snackBar.dart';
import '../../SignIn/widget/BottomTextInSignin.dart';
import '../../SignIn/widget/CustomElevatedButton.dart';
import '../../SignIn/widget/TextFormFieldWidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  String email = '';
  String password = '';
  bool isLoading = false;
  GlobalKey<FormState> fromKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
      
        body: SafeArea(
          child: Form(
            key:fromKey ,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(80),

                    Center(
                      child: Image.asset(
                        AppImages.logoImage,
                        height: 100,
                      ),
                    ),

                    const Gap(10),

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

                    TextWidgets(
                      text: AppString.signupName,
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
                      nameButton: AppString.signupName,
                        onPressed: () async {
                          if (fromKey.currentState!.validate()) {

                            isLoading = true;
                            setState(() {});

                            try {
                              await createuser();

                              snackBar(context, 'Success');

                            } on FirebaseAuthException catch (e) {

                              if (e.code == 'weak-password') {
                                snackBar(context, 'The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                snackBar(context, 'The account already exists for that email.');
                              }

                            } catch (e) {
                              snackBar(context, e.toString());
                            }

                            isLoading = false;
                            setState(() {});
                          }
                        }

                    ),

                    const Gap(20),

                    BottomTextInSignin(
                      bottomText: AppString.textBottomResName,
                      nameScreen: AppString.signinName,
                      screen: AppRoutes.signIn,
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



  Future<void> createuser() async {
      final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}