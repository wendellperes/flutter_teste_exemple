import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
//Minha Class Responsavel por Styles de texto
class AppTextStyles {
  static final TextStyle title = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleBold = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading40 = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading27 = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 27,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodylightGrey = GoogleFonts.notoSans(
    color: AppColors.lightGreen,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle bodyDarkGreen = GoogleFonts.notoSans(
    color: AppColors.darkGreen,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyDarkRed = GoogleFonts.notoSans(
    color: AppColors.darkRed,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle body20 = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle bodyLightGrey20 = GoogleFonts.notoSans(
    color: AppColors.lightGrey,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyWhite20 = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle body11 = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 11,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle black1 = GoogleFonts.notoSans(
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle subTitleApresentation = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28.0,
    color: Colors.white
  );
  static final TextStyle titleApresentation = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 50.0,
    color: Colors.white
  );
  static final TextStyle precoDesconto = TextStyle(
    decoration: TextDecoration.lineThrough,
    color: AppColors.lightGrey
  );
  static final TextStyle precoPrincipal = TextStyle(
    fontWeight: FontWeight.w700
  );
}