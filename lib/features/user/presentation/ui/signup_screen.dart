import 'package:flutter/material.dart';
import 'package:kuraa/core/assets/media_assets.dart';
import 'package:kuraa/core/helper/extension/context_extension.dart';
import 'package:kuraa/core/helper/gap.dart';
import 'package:kuraa/core/widgets/custom_button.dart';
import 'package:kuraa/core/widgets/custom_textfield.dart';

/// Login Page

class SignUpScreen extends StatefulWidget {
  ///
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /// user Email
  String? email;

  /// user Password
  String? password;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SignUp', style: context.textTheme.headlineLarge),
                VerticalGap.s,
                Divider(
                  thickness: 2,
                  color: context.secondary,
                ),
                VerticalGap.xl,
                CustomTextField(
                  prefixIcon: Icons.person,
                  hintText: 'username',
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                VerticalGap.l,
                CustomTextField(
                  prefixIcon: Icons.email,
                  hintText: 'email',
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                VerticalGap.l,
                dividerWidget(context),
                VerticalGap.l,
                CustomTextField(
                  prefixIcon: Icons.password,
                  hintText: 'password',
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  isPassword: true,
                ),
                VerticalGap.l,
                CustomTextField(
                  prefixIcon: Icons.password,
                  hintText: 'password',
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  isPassword: true,
                ),
                VerticalGap.exl,
                CustomElevatedButton(
                  onButtonPressed: () {},
                  buttonText: 'Register',
                ),
                VerticalGap.m,
                VerticalGap.l,
                const GoogleSigninButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider dividerWidget(BuildContext context) {
    return Divider(
      thickness: 2,
      color: context.secondary,
      indent: context.width * .2,
      endIndent: context.width * .2,
    );
  }
}

///Google Sign in
class GoogleSigninButton extends StatelessWidget {
  ///
  const GoogleSigninButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: context.onPrimary,
          radius: 22,
          child: Image.asset(MediaAsset.googleImage),
        ),
      ),
    );
  }
}
