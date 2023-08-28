//
//  password_manager
//  profile
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../../../shared/utils/extensions.dart';
import '../../utils/show_accounts_modal.dart';
import 'edit_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: sy(12),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (Platform.isIOS) {
                    showIOSAccountsModal(context);
                  } else {
                    showAndroidAccountsModal(context);
                  }
                },
                icon: ImageIcon(
                  const AssetImage('assets/icons/switch.png'),
                  size: sy(15),
                ),
              ),
            ],
          ),
          body: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'profile-image',
                  child: Container(
                    height: sy(70),
                    width: sy(70),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/memoji.png',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                Text(
                  'Steve Smith',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: sy(12),
                  ),
                ),
                Text(
                  'doe.steve@gmail.com',
                  style: TextStyle(
                    color: PbColors.textGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                GestureDetector(
                  onTap: () {
                    context.goTo(
                      page: const EditProfilePage(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sx(20),
                      vertical: sy(5),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: PbColors.border),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: PbColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sy(20),
                ),
                Container(
                  width: context.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: sx(20),
                    vertical: sy(10),
                  ),
                  decoration: BoxDecoration(
                    color: PbColors.grey1.withOpacity(0.33),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upgrade to PRO',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: sy(10),
                        ),
                      ),
                      SizedBox(
                        height: sy(10),
                      ),
                      Text(
                        'Do so much more with Passblock. Gain access to premium features to keep your apps password secured.',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(8),
                        ),
                      ),
                      SizedBox(
                        height: sy(10),
                      ),
                      Text(
                        'Compare prices and get started',
                        style: TextStyle(
                          color: PbColors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: sy(8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Notifications',
                    style: TextStyle(
                      color: PbColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(12),
                    ),
                  ),
                  trailing: Icon(
                    CupertinoIcons.chevron_right,
                    color: PbColors.black,
                    size: sy(15),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Backup',
                    style: TextStyle(
                      color: PbColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(12),
                    ),
                  ),
                  trailing: Icon(
                    CupertinoIcons.chevron_right,
                    color: PbColors.black,
                    size: sy(15),
                  ),
                ),
                SizedBox(
                  height: sy(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/icons/logout.png'),
                      color: PbColors.red,
                      size: sy(15),
                    ),
                    SizedBox(
                      width: sx(10),
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: PbColors.red,
                        fontWeight: FontWeight.w700,
                        fontSize: sy(10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
