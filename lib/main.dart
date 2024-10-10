import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/core/app_binding.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 18, 104, 179),
          primary: const Color.fromARGB(255, 18, 104, 179),
          secondary: const Color.fromARGB(255, 244, 121, 32),
        ),
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
