import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../../../shared/models/data/password_strength.dart';
import '../../../shared/utils/extensions.dart';
import '../../../shared/utils/passwords.dart';
import '../../../shared/widgets/pb_button.dart';
import '../../../shared/widgets/pb_sensitive_text_field.dart';
import '../../../shared/widgets/pb_text_field.dart';
import 'password_tags.dart';

class AddPasswordPage extends StatefulWidget {
  const AddPasswordPage({super.key});

  @override
  State<AddPasswordPage> createState() => _AddPasswordPageState();
}

class _AddPasswordPageState extends State<AddPasswordPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int passwordLength = 8;

  bool includeNumbers = false;
  bool includeLowercase = false;
  bool includeSymbols = false;
  bool includeUppercase = false;

  bool isFormValid() {
    return websiteController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Color passwordStrengthColor(PasswordStrength strength) {
    return switch (strength) {
      PasswordStrength.weak => PbColors.red,
      PasswordStrength.moderate => PbColors.orange,
      PasswordStrength.strong => PbColors.blue1,
      PasswordStrength.veryStrong => PbColors.green,
    };
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Password',
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
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: sy(15),
                  ),
                  PbTextField(
                    controller: websiteController,
                    hint: 'Website',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Website is required.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  PbTextField(
                    controller: usernameController,
                    hint: 'Email / Username',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email / Username is required.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PbSensitiveTextField(
                          controller: passwordController,
                          hint: 'Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required.';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                      GestureDetector(
                        onTap: () {
                          try {
                            final String password = generateRandomPassword(
                              length: passwordLength,
                              number: includeNumbers,
                              lowerCase: includeLowercase,
                              symbols: includeSymbols,
                              upperCase: includeUppercase,
                            );
                            setState(() {
                              passwordController.text = password;
                            });
                          } catch (e, _) {
                            Fluttertoast.showToast(
                              msg:
                                  'At least one character type must be selected.',
                              backgroundColor: PbColors.red,
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: sx(20),
                            vertical: sy(10),
                          ),
                          decoration: BoxDecoration(
                            color: PbColors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            CupertinoIcons.arrow_2_squarepath,
                            color: PbColors.white,
                            size: sy(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sy(5),
                  ),
                  Text(
                    determinePasswordStrength(passwordController.text).text,
                    style: TextStyle(
                      color: passwordStrengthColor(
                          determinePasswordStrength(passwordController.text)),
                      fontWeight: FontWeight.w400,
                      fontSize: sy(10),
                    ),
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Row(
                    children: [
                      Text(
                        'Length ($passwordLength)',
                        style: TextStyle(
                          color: PbColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(10),
                        ),
                      ),
                      SizedBox(
                        width: sx(20),
                      ),
                      Expanded(
                        child: Slider(
                          max: 32,
                          value: passwordLength.toDouble(),
                          divisions: 32,
                          label: passwordLength.toString(),
                          onChanged: (value) {
                            setState(() {
                              passwordLength = value.toInt();
                            });
                          },
                          thumbColor: PbColors.blue1,
                          inactiveColor: PbColors.grey1,
                          // allowedInteraction: SliderInteraction.slideOnly,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Number',
                      style: TextStyle(
                        color: PbColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(12),
                      ),
                    ),
                    value: includeNumbers,
                    onChanged: (value) {
                      setState(() {
                        includeNumbers = value;
                      });
                    },
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Lowercase',
                      style: TextStyle(
                        color: PbColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(12),
                      ),
                    ),
                    value: includeLowercase,
                    onChanged: (value) {
                      setState(() {
                        includeLowercase = value;
                      });
                    },
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Symbols',
                      style: TextStyle(
                        color: PbColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(12),
                      ),
                    ),
                    value: includeSymbols,
                    onChanged: (value) {
                      setState(() {
                        includeSymbols = value;
                      });
                    },
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Uppercase',
                      style: TextStyle(
                        color: PbColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(12),
                      ),
                    ),
                    value: includeUppercase,
                    onChanged: (value) {
                      setState(() {
                        includeUppercase = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: sy(80),
                  ),
                  PbButton(
                    isDisabled: !isFormValid(),
                    disabledBtnColor: PbColors.grey1,
                    text: 'Continue',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.goTo(
                          page: PasswordTagsPage(
                            website: websiteController.text,
                            email: usernameController.text,
                            password: passwordController.text,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
