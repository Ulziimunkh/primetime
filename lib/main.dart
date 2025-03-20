import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/pages/Login/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primetime/pages/Organization/organization_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (context) => 
       PlatformTheme(
        builder: (context) => PlatformApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
  ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'PrimeTime',
      locale: Locale('mn'),
      home: const OrganizaionPage(), // Ensure HomePage is set as the home
    ),
       ),
    );
  }
}


