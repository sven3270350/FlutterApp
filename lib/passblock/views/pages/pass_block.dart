//
//  password_manager
//  pass_block
//
//  Created by Ngonidzashe Mangudya on 22/08/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../passwords/views/pages/add_password.dart';
import '../../../shared/configs/colors.dart';
import '../../../shared/state/navigation/navigation_bloc.dart';
import '../../../shared/utils/extensions.dart';
import 'analysis.dart';
import 'home.dart';
import 'search.dart';
import 'settings.dart';

class PassBlockFrictionlessSecurityApp extends StatefulWidget {
  const PassBlockFrictionlessSecurityApp({super.key});

  @override
  State<PassBlockFrictionlessSecurityApp> createState() =>
      _PassBlockFrictionlessSecurityAppState();
}

class _PassBlockFrictionlessSecurityAppState
    extends State<PassBlockFrictionlessSecurityApp> {
  final PageController pageController = PageController();

  final Map<int, String> pageTitleIndexMap = {
    0: 'Password',
    1: 'Security',
    2: 'Search',
    3: 'Settings',
  };

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return BlocBuilder<NavigationBloc, int>(
          builder: (context, state) {
            return Scaffold(
              appBar: state != 2
                  ? AppBar(
                      leading: Center(
                        child: ImageIcon(
                          const AssetImage('assets/icons/person.png'),
                          size: sy(15),
                        ),
                      ),
                      title: Text(
                        pageTitleIndexMap[state] ?? 'Password',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(12),
                        ),
                      ),
                      actions: [
                        if (state == 1)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: sy(15),
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                      ],
                    )
                  : null,
              body: SizedBox(
                height: context.height,
                width: context.width,
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    HomePage(),
                    AnalysisPage(),
                    SearchPage(),
                    SettingsPage(),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: state,
                onTap: (index) {
                  context.read<NavigationBloc>().add(NavigationAction(index));
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                elevation: 1,
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      state == 0
                          ? const AssetImage('assets/icons/home-filled.png')
                          : const AssetImage('assets/icons/home.png'),
                      size: sy(15),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      state == 1
                          ? const AssetImage('assets/icons/analysis-filled.png')
                          : const AssetImage('assets/icons/analysis.png'),
                      size: sy(15),
                    ),
                    label: 'Security',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      const AssetImage('assets/icons/search.png'),
                      size: sy(15),
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      state == 3
                          ? const AssetImage('assets/icons/settings-filled.png')
                          : const AssetImage('assets/icons/settings.png'),
                      size: sy(15),
                    ),
                    label: 'Settings',
                  ),
                ],
              ),
              floatingActionButton: AnimatedSwitcher(
                duration: 200.milliseconds,
                child: state == 0
                    ? FloatingActionButton(
                        backgroundColor: PbColors.black,
                        onPressed: () {
                          context.goTo(
                            page: const AddPasswordPage(),
                          );
                        },
                        child: ImageIcon(
                          const AssetImage('assets/icons/key.png'),
                          size: sy(15),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            );
          },
        );
      },
    );
  }
}
