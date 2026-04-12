import 'package:chat_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
    required this.title,
     this.icon1,
     this.icon2, required this.image,
  });
  final String title;
  final IconData? icon1;
  final IconData? icon2;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: preferredSize.height,
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      centerTitle: true,
      title: Row(
mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
        image,
            height: 50,

          ),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),
          ),

        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
