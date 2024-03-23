import 'package:flutter/material.dart';
import 'package:markiz_elamal/features/splash_feature/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
