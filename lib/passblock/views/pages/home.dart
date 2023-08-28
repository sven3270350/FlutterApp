//
//  password_manager
//  home
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../../models/data/password_type.dart';
import '../widgets/password_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PasswordType passwordType = PasswordType.all;

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
          child: Column(
            children: [
              SizedBox(
                height: sy(10),
              ),
              SizedBox(
                height: sy(20),
                width: context.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: PasswordType.values.map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          passwordType = e;
                        });
                      },
                      child: AnimatedContainer(
                        duration: 200.milliseconds,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: sx(20),
                        ),
                        margin: EdgeInsets.only(
                          right: sx(10),
                        ),
                        decoration: BoxDecoration(
                          color: e == passwordType
                              ? PbColors.black
                              : PbColors.grey1.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          e.name,
                          style: TextStyle(
                            color: e == passwordType
                                ? PbColors.white
                                : PbColors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: sy(20),
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
        );
      },
    );
  }
}
