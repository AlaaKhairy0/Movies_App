import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/colors_manager.dart';

class AppStyle {
  static TextStyle bottomNavLabel = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle appBar = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white
  );
  static TextStyle textSlider = GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white
  );  static TextStyle rateText = GoogleFonts.inter(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white
  );  static TextStyle textFilmDetails = GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white
  );
  static TextStyle dateSlider = GoogleFonts.inter(
      fontSize: 10.sp,
      fontWeight: FontWeight.w700,
      color: Colors.grey
  );
  static TextStyle titleListView = GoogleFonts.inter(
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
  color: Colors.white);
  static TextStyle action = GoogleFonts.inter(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static TextStyle descriptionFilm = GoogleFonts.inter(
      fontSize: 13.sp,
      color: Colors.white);
    static TextStyle tabHeader = GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle categoryLabel = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle movieName = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ); 
  static TextStyle movieDetails = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(.67),
  );  static TextStyle search  = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.graySearch,
  );



}
