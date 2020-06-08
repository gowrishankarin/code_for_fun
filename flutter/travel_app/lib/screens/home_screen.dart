import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'package:travel_app/global/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi Gary",
                              style: GoogleFonts.poppins(
                                  color: AppColors.veryLightTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18)),
                          Text("where\nare you going\non vacations",
                              style: GoogleFonts.playfairDisplay(
                                  color: AppColors.darkTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 36),),
                        ],
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 30,
                        child: ClipOval(child: Image.asset("assets/dp.jpg")),
                      ),
                      right: 0,
                      top: 0,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 16),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top",
                      style: GoogleFonts.poppins(
                        color: AppColors.lightGreenColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "For you",
                      style: GoogleFonts.poppins(
                        color: AppColors.veryLightTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Hidden Gems",
                      style: GoogleFonts.poppins(
                        color: AppColors.veryLightTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: AppColors.veryLightTextColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
