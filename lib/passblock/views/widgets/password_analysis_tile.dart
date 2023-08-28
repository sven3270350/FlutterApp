//
//  password_manager
//  password_analysis_tile
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../../../shared/utils/extensions.dart';
import '../pages/password.dart';

class PasswordAnalysisTile extends StatelessWidget {
  const PasswordAnalysisTile({
    required this.title,
    required this.email,
    required this.asset,
    super.key,
  });

  final String title;
  final String email;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: () {
            context.goTo(
              page: PasswordPage(
                title: title,
                email: email,
                asset: asset,
              ),
            );
          },
          child: ListTile(
            contentPadding: EdgeInsets.only(
              bottom: sy(10),
            ),
            // todo: hero here
            leading: Container(
              height: sy(40),
              width: sy(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(asset),
                ),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: PbColors.black,
                fontWeight: FontWeight.w500,
                fontSize: sy(10),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email,
                  style: TextStyle(
                    color: PbColors.textGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(8),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      PbColors.green1,
                    ),
                    backgroundColor: PbColors.grey1,
                    minHeight: sy(4),
                  ),
                ),
              ],
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(
                horizontal: sx(10),
                vertical: sy(2),
              ),
              decoration: BoxDecoration(
                color: PbColors.green1.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Safe',
                style: TextStyle(
                  color: PbColors.green1,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(8),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
