//
//  password_manager
//  pass_block
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';

import 'onboarding/views/pages/onboarding.dart';
import 'shared/configs/colors.dart';

class PassBlockApp extends StatelessWidget {
  const PassBlockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PassBlock',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: PbColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: PbColors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: PbColors.black,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: PbColors.white,
          elevation: 1,
          selectedItemColor: PbColors.black,
          unselectedItemColor: PbColors.black,
        ),
      ),
      home: const OnboardingPage(),
    );
  }
}
