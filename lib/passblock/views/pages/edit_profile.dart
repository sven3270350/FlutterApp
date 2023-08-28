//
//  password_manager
//  edit_profile
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../../../shared/widgets/pb_button.dart';
import '../../../shared/widgets/pb_sensitive_text_field.dart';
import '../../../shared/widgets/pb_text_field.dart';
import '../../utils/show_accounts_modal.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
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
                ),
                SizedBox(
                  height: sy(10),
                ),
                Center(
                  child: GestureDetector(
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
                        'Upload Image',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sy(20),
                ),
                Text(
                  'Full Name',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(
                  height: sy(5),
                ),
                PbTextField(
                  controller: fullNameController,
                  hint: 'Full Name',
                ),
                SizedBox(
                  height: sy(10),
                ),
                Text(
                  'Email',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(
                  height: sy(5),
                ),
                PbTextField(
                  controller: emailController,
                  hint: 'Email',
                ),
                SizedBox(
                  height: sy(10),
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(
                  height: sy(5),
                ),
                PbSensitiveTextField(
                  controller: passwordController,
                  hint: 'Password',
                ),
                SizedBox(
                  height: sy(10),
                ),
                SizedBox(
                  height: sy(20),
                ),
                const PbButton(text: 'Update Profile'),
              ],
            ),
          ),
        );
      },
    );
  }
}
