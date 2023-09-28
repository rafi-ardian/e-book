import "dart:ui";

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color backgroundColor = Color(0xFFE5E5E5);
Color whiteColor = Color(0xFFFFFFFFF);
Color blackColor = Color(0xFF2D2D2D);
Color greyColorSearchField = Color(0xFFF8F8F8);
Color greenColor = Color(0xFF098B5C);
Color dividerColor = Color(0xFF6B6B6B);
Color greyColor = Color(0xFF6B6B6B);
Color borderRecentBook = Color(0xFFF3F3F3);
Color ratingColor = Color(0xFFF7F7F7);

// SEMIBOLD
TextStyle semiBoldText16 =
    GoogleFonts.poppins(fontSize: 16, fontWeight: semiBold);
TextStyle semiBoldText14 =
    GoogleFonts.poppins(fontSize: 14, fontWeight: semiBold);
TextStyle semiBoldText20 =
    GoogleFonts.poppins(fontSize: 20, fontWeight: semiBold);
TextStyle semiBoldText12 =
    GoogleFonts.poppins(fontSize: 12, fontWeight: semiBold);

// REGULAR
TextStyle regularText14 =
    GoogleFonts.poppins(fontSize: 14, fontWeight: regular);
TextStyle regularText12 =
    GoogleFonts.poppins(color: greyColor, fontSize: 12, fontWeight: regular);

// MEDIUM
TextStyle mediumText12 =
    GoogleFonts.poppins(color: dividerColor, fontSize: 12, fontWeight: medium);
TextStyle mediumText14 = GoogleFonts.poppins(fontSize: 14, fontWeight: medium);
TextStyle mediumText10 = GoogleFonts.poppins(fontSize: 10, fontWeight: medium);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
