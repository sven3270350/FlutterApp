//
//  password_manager
//  password_tile
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';

class PasswordTile extends StatelessWidget {
  const PasswordTile({
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
        return ListTile(
          contentPadding: EdgeInsets.only(
            bottom: sy(10),
          ),
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
          subtitle: Text(
            email,
            style: TextStyle(
              color: PbColors.textGrey,
              fontWeight: FontWeight.w400,
              fontSize: sy(8),
            ),
          ),
          trailing: ImageIcon(
            const AssetImage(
              'assets/icons/copy.png',
            ),
            color: PbColors.black,
            size: sy(15),
          ),
        );
      },
    );
  }
}
