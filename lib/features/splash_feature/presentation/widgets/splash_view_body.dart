import 'package:flutter/material.dart';
import 'package:markiz_elamal/core/utils/app_colors.dart';
import 'package:markiz_elamal/core/utils/app_paths.dart';
import 'package:markiz_elamal/features/onboarding_feature/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideTextAnimate;

  @override
  void initState() {
    super.initState();

    //init Sliding Animation
    initSlidingAnimation();
    //to navigate to home screen after duration with animation
    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppPaths.appLogo),
          // AnimatedBuilder to refresh widget
          AnimatedBuilder(
              animation: slideTextAnimate,
              builder: (context, _) {
                return SlideTransition(
                  position: slideTextAnimate,
                  child: const Text(
                    'Markiz ElAmal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

//Method to navigate to home screen after duration with animation
  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const OnBoardingView();
          }),
        );
      },
    );
  }

//Method to init Sliding Animation
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slideTextAnimate =
        Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
