
import 'package:chat_app/core/constants/app_string.dart';
import 'package:chat_app/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';


import '../../../core/colors/app_colors.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.nameButton,required this.onPressed,
  });
final String nameButton;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        child: TextWidgets(
          text:nameButton,
          textStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}