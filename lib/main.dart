import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markiz_elamal/core/utils/app_colors.dart';
import 'package:markiz_elamal/features/splash_feature/presentation/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Markiz Elamal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
        ////----> AppBar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: kWhiteColor,
          iconTheme: IconThemeData(
            color: kWhiteColor,
          ),
        ),
      ),
      home: const SplashView(),
    );
  }
}
