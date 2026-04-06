
import 'package:chat_app/core/constants/app_string.dart';

import 'package:flutter/material.dart';


class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key, required this.name,
  });
final String name;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: name,
        hintStyle:TextStyle(color: Colors.white) ,


        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),


        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),


        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),


        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),


        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}
