
import 'package:chat_app/core/constants/app_string.dart';

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.name,
    required this.onchanged,

  });

  final String name;
  final Function(String) onchanged;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Field is required';
        }



        return null;
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: name,
        hintStyle: const TextStyle(color: Colors.white),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}