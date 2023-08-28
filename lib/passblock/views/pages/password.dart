//
//  password_manager
//  password
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({
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
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.delete,
                  color: PbColors.red,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag: 'password-header',
                    child: Container(
                      height: sy(80),
                      width: sy(80),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(asset),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: PbColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(12),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    email,
                    style: TextStyle(
                      color: PbColors.textGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
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
                          'Edit Password',
                          style: TextStyle(
                            color: PbColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: sx(10),
                    ),
                    ImageIcon(
                      const AssetImage('assets/icons/copy.png'),
                      color: PbColors.black,
                      size: sy(15),
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(20),
                ),
                Text(
                  'Details',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: sy(12),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Website URL',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'adobe.com',
                        style: TextStyle(
                          color: PbColors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(10),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'User ID',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        email,
                        style: TextStyle(
                          color: PbColors.textGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(10),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Password',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '*********',
                        style: TextStyle(
                          color: PbColors.textGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.remove_red_eye,
                      color: PbColors.black,
                      size: sy(15),
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(10),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Tags',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: sx(15),
                              vertical: sy(5),
                            ),
                            decoration: BoxDecoration(
                              color: PbColors.blue2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Work',
                              style: TextStyle(
                                color: PbColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(8),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: sx(10),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: sx(15),
                              vertical: sy(5),
                            ),
                            decoration: BoxDecoration(
                              color: PbColors.blue2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: PbColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(8),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: sx(10),
                          ),
                          Text(
                            '+2 more',
                            style: TextStyle(
                              color: PbColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(8),
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
                Text(
                  'Settings',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: sy(12),
                  ),
                ),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Autofill',
                    style: TextStyle(
                      color: PbColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(10),
                    ),
                  ),
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
