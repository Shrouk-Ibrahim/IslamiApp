import 'package:flutter/material.dart';
import 'package:islami_project/home/home-screen.dart';
import 'package:islami_project/home/quran/sura_details_screen.dart';
import 'package:islami_project/provider/app-configuration-provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/hadeth/hadeth_details_screen.dart';
import 'my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create:(context) => AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
    );
  }

  Future<void> initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    var language = prefs.getString('language');
    if (language != null) {
      provider.changeLanguage(language);
    }
    var isDark = prefs.getBool('isDark');
    if (isDark == true) {
      provider.changeTheme(ThemeMode.dark);
    } else if (isDark == false) {
      provider.changeTheme(ThemeMode.light);
    }
  }
}
