import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../passblock/views/pages/pass_block.dart';
import '../../../shared/configs/colors.dart';
import '../../../shared/utils/extensions.dart';
import '../../../shared/widgets/pb_button.dart';

class ConfirmMobileNumberPage extends StatefulWidget {
  const ConfirmMobileNumberPage({super.key});

  @override
  State<ConfirmMobileNumberPage> createState() =>
      _ConfirmMobileNumberPageState();
}

class _ConfirmMobileNumberPageState extends State<ConfirmMobileNumberPage> {
  final OtpFieldController otpFieldController = OtpFieldController();
  String otp = '';

  bool isFormValid() {
    final bool valid = otp.length == 4;
    log('isFormValid: $valid');
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: sy(20),
                ),
                Center(
                  child: Image(
                    image: const AssetImage('assets/images/logo-text.png'),
                    height: sy(80),
                  ),
                ),
                SizedBox(
                  height: sy(40),
                ),
                Text(
                  'We’ve sent your confirmation code to your number. Enter '
                  '4-digit verification code below.',
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(10),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: sy(50),
                ),
                OTPTextField(
                  width: context.width,
                  fieldWidth: sx(80),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: sy(8),
                  ),
                  style: TextStyle(
                    color: PbColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: sy(12),
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldStyle: FieldStyle.box,
                  onChanged: (pin) {
                    log('Changed: $pin');
                    setState(() {
                      otp = pin;
                    });
                  },
                  onCompleted: (pin) {
                    log('Completed: $pin');
                    setState(() {
                      otp = pin;
                    });
                  },
                  controller: otpFieldController,
                ),
                SizedBox(
                  height: sy(100),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive a code? ",
                      style: TextStyle(
                        color: PbColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(10),
                      ),
                    ),
                    Text(
                      'Click',
                      style: TextStyle(
                        color: PbColors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: sy(10),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(10),
                ),
                PbButton(
                  isDisabled: !isFormValid(),
                  disabledBtnColor: PbColors.grey.withOpacity(0.4),
                  text: 'Verify and Continue',
                  onTap: () {
                    context.goTo(
                      page: const PassBlockFrictionlessSecurityApp(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
