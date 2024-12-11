import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle bottomNavLabel = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
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
  );
}
