//
//  password_manager
//  password_tags
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../passblock/models/data/password_type.dart';
import '../../../shared/configs/colors.dart';
import '../../../shared/utils/extensions.dart';
import '../../../shared/widgets/pb_button.dart';
import 'password_creation_success.dart';

class PasswordTagsPage extends StatefulWidget {
  const PasswordTagsPage({
    required this.website,
    required this.email,
    required this.password,
    super.key,
  });

  final String website;
  final String email;
  final String password;

  @override
  State<PasswordTagsPage> createState() => _PasswordTagsPageState();
}

class _PasswordTagsPageState extends State<PasswordTagsPage> {
  List<PasswordType> selectedPasswordTypes = [];

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Tag your password',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: sy(12),
              ),
            ),
          ),
          body: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select the tags that best describes the application password you just generated.',
                  style: TextStyle(
                    color: PbColors.textGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(
                  height: sy(20),
                ),
                Expanded(
                  child: Wrap(
                    runSpacing: sy(10),
                    spacing: sx(15),
                    children: PasswordType.values
                        .where((e) => e != PasswordType.all)
                        .map((e) {
                      return GestureDetector(
                        onTap: () {
                          if (selectedPasswordTypes.contains(e)) {
                            selectedPasswordTypes.remove(e);
                          } else {
                            selectedPasswordTypes.add(e);
                          }
                          setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: 200.milliseconds,
                          padding: EdgeInsets.symmetric(
                            horizontal: sx(20),
                            vertical: sy(5),
                          ),
                          decoration: BoxDecoration(
                            color: selectedPasswordTypes.contains(e)
                                ? PbColors.blue2
                                : PbColors.grey1.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                            border: selectedPasswordTypes.contains(e)
                                ? Border.all(
                                    color: PbColors.blue1,
                                  )
                                : null,
                          ),
                          child: Text(
                            e.name,
                            style: TextStyle(
                              color: selectedPasswordTypes.contains(e)
                                  ? PbColors.white
                                  : PbColors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                              fontSize: sy(8),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: PbButton(
                        text: 'Skip',
                        btnColor: PbColors.black.withOpacity(0.4),
                        onTap: () {
                          context.goTo(
                            page: PasswordCreationSuccessPage(
                              website: widget.website,
                              email: widget.email,
                              password: widget.password,
                              tags: const [],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: sx(20),
                    ),
                    Expanded(
                      child: PbButton(
                        text: 'Continue',
                        onTap: () {
                          context.goTo(
                            page: PasswordCreationSuccessPage(
                              website: widget.website,
                              email: widget.email,
                              password: widget.password,
                              tags: selectedPasswordTypes,
                            ),
                          );
                        },
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
