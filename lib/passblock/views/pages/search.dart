//
//  password_manager
//  search
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../widgets/password_tile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sy(10),
                ),
                Container(
                  width: context.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: sx(10),
                  ),
                  decoration: BoxDecoration(
                    color: PbColors.grey1.withOpacity(0.62),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search password ...',
                      prefixIcon: Icon(CupertinoIcons.search),
                    ),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                Text(
                  'Recently Used',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: const [
                      PasswordTile(
                        title: 'Behance',
                        email: 'design.steve@gmail.com',
                        asset: 'assets/images/behance.png',
                      ),
                      PasswordTile(
                        title: 'Adobe',
                        email: 'work.steve@gmail.com',
                        asset: 'assets/images/adobe.png',
                      ),
                      PasswordTile(
                        title: 'Netflix',
                        email: 'chill.steve@gmail.com',
                        asset: 'assets/images/netflix.png',
                      ),
                      PasswordTile(
                        title: 'Spotify',
                        email: 'chill.steve@gmail.com',
                        asset: 'assets/images/spotify.png',
                      ),
                      PasswordTile(
                        title: 'Steam',
                        email: 'chill.steve@gmail.com',
                        asset: 'assets/images/steam.png',
                      ),
                      PasswordTile(
                        title: 'Medium',
                        email: 'work.steve@gmail.com',
                        asset: 'assets/images/medium.png',
                      ),
                      PasswordTile(
                        title: 'Apple',
                        email: 'devices.steve@gmail.com',
                        asset: 'assets/images/apple.png',
                      ),
                      PasswordTile(
                        title: 'Spotify',
                        email: 'chill.steve@gmail.com',
                        asset: 'assets/images/spotify.png',
                      ),
                      PasswordTile(
                        title: 'Steam',
                        email: 'chill.steve@gmail.com',
                        asset: 'assets/images/steam.png',
                      ),
                      PasswordTile(
                        title: 'Medium',
                        email: 'work.steve@gmail.com',
                        asset: 'assets/images/medium.png',
                      ),
                      PasswordTile(
                        title: 'Apple',
                        email: 'devices.steve@gmail.com',
                        asset: 'assets/images/apple.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
