//
//  password_manager
//  profile_tile
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../../../shared/utils/extensions.dart';
import '../pages/profile.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: () {
            context.goTo(
              page: const ProfilePage(),
            );
          },
          child: Row(
            children: [
              Hero(
                tag: 'profile-image',
                child: Container(
                  height: sy(40),
                  width: sy(40),
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
                width: sx(20),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
              ),
              SizedBox(
                width: sx(10),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                color: PbColors.black,
                size: sy(15),
              ),
            ],
          ),
        );
      },
    );
  }
}
