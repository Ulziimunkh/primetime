import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primetime/common/constants/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primetime/presentation/Welcome/pages/welcome_page.dart';
import 'package:primetime/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: kPrimaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  // Initialize the service locator
  // This is where you would set up your service locator, if you have one
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
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
      
      home: const WelcomePage(), // Ensure HomePage is set as the home
    ),
       ),
    );
  }
}


