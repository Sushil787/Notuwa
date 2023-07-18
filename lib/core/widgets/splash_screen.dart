import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/assets/media_assets.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/core/helper/extension/context_extension.dart';
import 'package:kuraa/core/helper/gap.dart';

/// Spash Screen
class SplashScreen extends StatefulWidget {
  ///
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5, milliseconds: 500),
      () => context.go(AppRoutes.main),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Image.asset(MediaAsset.chattingGif),
            ),
            SizedBox(
              height: 50,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Maan ka Kuraaa',
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.black,
                      Colors.yellow,
                    ],
                    textStyle: context.textTheme.headlineLarge!,
                  ),
                ],
              ),
            ),
            VerticalGap.m,
            SizedBox(
              height: 70,
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    'Streamlined',
                    duration: const Duration(
                      seconds: 1,
                    ),
                    textStyle: context.textTheme.headlineLarge,
                  ),
                  FadeAnimatedText(
                    'Personalized ',
                    duration: const Duration(
                      seconds: 1,
                    ),
                    textStyle: context.textTheme.headlineLarge,
                  ),
                  FadeAnimatedText(
                    ' Welcome to maan ka kuraa',
                    textAlign: TextAlign.center,
                    textStyle: context.textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
