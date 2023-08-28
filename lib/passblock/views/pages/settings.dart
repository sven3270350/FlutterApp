//
//  password_manager
//  settings
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../widgets/profile_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: sy(20),
              ),
              const ProfileTile(),
              SizedBox(
                height: sy(15),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Permissions',
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
                  'Security',
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
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Sync',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(12),
                  ),
                ),
                value: false,
                onChanged: (value) {},
              ),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Autofill',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(12),
                  ),
                ),
                value: false,
                onChanged: (value) {},
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'About',
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
                  'Help',
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
                  'Version',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(12),
                  ),
                ),
                trailing: Text(
                  '1.0.0',
                  style: TextStyle(
                    color: PbColors.textGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
