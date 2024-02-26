import 'package:e_com/const/app_colors.dart';
import 'package:flutter/material.dart';

Widget SocialMediaButton(String image){
  return InkWell(
    borderRadius: BorderRadius.circular(50),
    onTap: (){},
    child: Ink(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.grayColor,
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0,3)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(image),
      ),
    ),
  );
}