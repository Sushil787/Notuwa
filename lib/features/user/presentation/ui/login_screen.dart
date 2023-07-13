import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/assets/media_assets.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/core/helper/extension/context_extension.dart';
import 'package:kuraa/core/helper/gap.dart';
import 'package:kuraa/core/widgets/custom_button.dart';
import 'package:kuraa/core/widgets/custom_textfield.dart';
import 'package:kuraa/features/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:kuraa/features/user/presentation/cubit/credential/cubit/credential_cubit.dart';

/// Login Page

class LoginScreen extends StatefulWidget {
  ///
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// user Email
  String? email;

  /// user Password
  String? password;

  /// Form Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<CredentialCubit, CredentialState>(
            listener: (context, state) {
              if (state is CredentialFailure) {
                context.showSnackBar(
                  message: state.message.replaceAll('-', ' '),
                  toastType: ToastType.error,
                );
                context.read<AuthCubit>().appStarted();
              }
              if (state is CredentialSuccess) {
                context
                  ..showSnackBar(
                    message: 'logged in success',
                    toastType: ToastType.success,
                  )
                  ..go(AppRoutes.home);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('login', style: context.textTheme.headlineLarge),
                  VerticalGap.s,
                  Divider(
                    thickness: 2,
                    color: context.secondary,
                  ),
                  VerticalGap.xl,
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          prefixIcon: Icons.email,
                          hintText: 'Email',
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        VerticalGap.l,
                        CustomTextField(
                          prefixIcon: Icons.password,
                          hintText: 'password',
                          onChanged: (value) {
                            password = value;
                          },
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                  VerticalGap.exl,
                  CustomElevatedButton(
                    isLoading: state is CredentialLoading,
                    onButtonPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<CredentialCubit>().signIn(
                              email: email!,
                              password: password!,
                            );
                      }
                    },
                    buttonText: 'login',
                  ),
                  VerticalGap.m,
                  const RegisterText(),
                  VerticalGap.l,
                  const GoogleSigninButton()
                ],
              );
            },
          ),
        ),
      ),
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
        onTap: () {
          context.read<CredentialCubit>().googleSignin();
        },
        child: CircleAvatar(
          backgroundColor: context.onPrimary,
          radius: 22,
          child: Image.asset(MediaAsset.googleImage),
        ),
      ),
    );
  }
}

/// Don't Have A/C register
class RegisterText extends StatelessWidget {
  ///
  const RegisterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("don't have account "),
          SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: () {
                context.push(AppRoutes.signup);
              },
              child: Text(
                'Register',
                style: context.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
