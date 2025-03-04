import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';

class Forgetresetbody extends StatefulWidget {
  const Forgetresetbody({super.key});

  @override
  State<Forgetresetbody> createState() => _ForgetresetbodyState();
}

class _ForgetresetbodyState extends State<Forgetresetbody> {
  GlobalKey<FormState> keyform = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: keyform,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Password reset code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: kprimarykey,
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            const Text(
              'Email Verification',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kprimarykey,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Get Your Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kprimarykey,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Please enter the four-digit code',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kprimarykey,
              ),
            ),
            const Text(
              'sent to your email address',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kprimarykey,
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            const Custompincodeconfirm(),
            const SizedBox(
              height: 31,
            ),
            Row(
              children: [
                const Text(
                  'If you do not receive the code !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kprimarykey,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Reset',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: kprimarykey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Customelevatedbutton(
                onpressed: () {
                  if (keyform.currentState!.validate()) {
                    GoRouter.of(context).pushReplacement(Gorouter.kresetpassword);
                  }
                },
                title: 'Verify')
          ],
        ),
      ),
    );
  }
}

class Custompincodeconfirm extends StatefulWidget {
  const Custompincodeconfirm({
    super.key,
  });

  @override
  State<Custompincodeconfirm> createState() => _CustompincodeconfirmState();
}

class _CustompincodeconfirmState extends State<Custompincodeconfirm> {
  final TextEditingController otp = TextEditingController();

  @override
  void dispose() {
   //  otp.clear();
   // otp.dispose();
   
    super.dispose();
  }

  bool emptybool = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 65),
      child: PinCodeTextField(
        appContext: context,
        validator: (value) {
          if (value!.isEmpty) {
            emptybool = true;
            setState(() {});
            return 'Enter your code';
          } else {
            emptybool = false;
            return null;
          }
        },
        length: 4,
        controller: otp,
        enableActiveFill: true,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            activeColor: Colors.white,
            inactiveColor: !emptybool ? Colors.white : Colors.red,
            inactiveFillColor: !emptybool ? Colors.white : Colors.red,
            disabledColor: Colors.white,
            fieldWidth: 50,
            errorBorderColor: Colors.red,
            borderWidth: 1,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
/* Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.grey,
          height: 45,
          width: 45,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            // keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 45,
          width: 45,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            // keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 45,
          width: 45,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            // keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 45,
          width: 45,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              FocusScope.of(context).nextFocus();
            },
            //keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
      ],
    ));
  */
