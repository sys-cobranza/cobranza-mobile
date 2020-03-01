import 'dart:convert';

import 'package:cobranza/models/dio_client.dart';
import 'package:cobranza/models/provide/i18n.dart';
import 'package:cobranza/models/provide/locale_provide.dart';
import 'package:cobranza/models/provide/theme_provide.dart';
import 'package:cobranza/models/provide/user_provide.dart';
import 'package:cobranza/screens/splash_screen.dart';
import 'package:cobranza/utils/app_route.dart';
import 'package:cobranza/utils/app_shared_preferences.dart';
import 'package:cobranza/utils/sp_util.dart';
import 'package:cobranza/utils/string_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provide/provide.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

void main() async {
  await appSP.init();

  (dioClient.dio.transformer as DefaultTransformer).jsonDecodeCallback =
      parseJson;
  final providers = Providers()
    ..provide(Provider.value(UserProvide()))
    ..provide(Provider.value(LocaleProvide()))
    ..provide(Provider.value(ThemeProvide()));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(ProviderNode(
        providers: providers,
        child: MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies(){
    //theme
    int themeIndex = SpUtil.getThemeIndex();
    if (themeIndex != null) {
      Provide.value<ThemeProvide>(context).changeTheme(themeIndex);
    }
    //language
    String lang = SpUtil.getLanguage();
    if (StringUtil.isNotEmpty(lang)) {
      Provide.value<LocaleProvide>(context).changeLocale(Locale(lang));
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<LocaleProvide>(
      builder: (context, child, localeProvide) {
        return Provide<ThemeProvide>(
          builder: (context, child, themeProvide) {
            return MaterialApp(
              locale: localeProvide.locale,
              //Defina una ruta estática, no se pueden pasar parámetros
              routes: appRoute.routes,
              navigatorObservers: [
                appRoute,
              ],
              // Configuraciones de internacionalización
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate, // for iOS
              ],
              supportedLocales: S.delegate.supportedLocales,

              //Especificando el idioma predeterminado
              title: 'Cobranza UI',
              onGenerateTitle: (context) => S.current.appTitle,
              theme: themeProvide.themeData,
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
            );
          },
        );
      },
    );
  }
}
