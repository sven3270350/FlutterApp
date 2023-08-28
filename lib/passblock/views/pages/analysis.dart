//
//  password_manager
//  analysis
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../widgets/password_analysis_tile.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: sy(80),
                width: sy(80),
                child: Stack(
                  children: [
                    SizedBox(
                      height: sy(80),
                      width: sy(80),
                      child: CircularProgressIndicator(
                        value: 0.82,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          PbColors.green1,
                        ),
                        // strokeCap: StrokeCap.round,
                        strokeWidth: sx(10),
                        semanticsLabel: 'Secured',
                        semanticsValue: '82% Secured',
                        backgroundColor: PbColors.grey.withOpacity(0.5),
                      ),
                    ),
                    Center(
                      child: Text(
                        '82%',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Text(
                '82% Secured',
                style: TextStyle(
                  color: PbColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(10),
                ),
              ),
              SizedBox(
                height: sy(30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: sy(60),
                    width: sx(120),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PbColors.border,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '82',
                          style: TextStyle(
                            color: PbColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: sy(15),
                          ),
                        ),
                        Text(
                          'Safe',
                          style: TextStyle(
                            color: PbColors.green1,
                            fontWeight: FontWeight.w700,
                            fontSize: sy(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: sy(60),
                    width: sx(120),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PbColors.border,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '12',
                          style: TextStyle(
                            color: PbColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: sy(15),
                          ),
                        ),
                        Text(
                          'Weak',
                          style: TextStyle(
                            color: PbColors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: sy(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: sy(60),
                    width: sx(120),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PbColors.border,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '8',
                          style: TextStyle(
                            color: PbColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: sy(15),
                          ),
                        ),
                        Text(
                          'Risk',
                          style: TextStyle(
                            color: PbColors.red,
                            fontWeight: FontWeight.w700,
                            fontSize: sy(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sy(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Analysis',
                    style: TextStyle(
                      color: PbColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(12),
                    ),
                  ),
                  ImageIcon(
                    const AssetImage('assets/icons/filter.png'),
                    color: PbColors.black,
                    size: sy(15),
                  ),
                ],
              ),
              SizedBox(
                height: sy(10),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    PasswordAnalysisTile(
                      title: 'Behance',
                      email: 'design.steve@gmail.com',
                      asset: 'assets/images/behance.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Adobe',
                      email: 'work.steve@gmail.com',
                      asset: 'assets/images/adobe.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Netflix',
                      email: 'chill.steve@gmail.com',
                      asset: 'assets/images/netflix.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Spotify',
                      email: 'chill.steve@gmail.com',
                      asset: 'assets/images/spotify.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Steam',
                      email: 'chill.steve@gmail.com',
                      asset: 'assets/images/steam.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Medium',
                      email: 'work.steve@gmail.com',
                      asset: 'assets/images/medium.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Apple',
                      email: 'devices.steve@gmail.com',
                      asset: 'assets/images/apple.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Spotify',
                      email: 'chill.steve@gmail.com',
                      asset: 'assets/images/spotify.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Steam',
                      email: 'chill.steve@gmail.com',
                      asset: 'assets/images/steam.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Medium',
                      email: 'work.steve@gmail.com',
                      asset: 'assets/images/medium.png',
                    ),
                    PasswordAnalysisTile(
                      title: 'Apple',
                      email: 'devices.steve@gmail.com',
                      asset: 'assets/images/apple.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
