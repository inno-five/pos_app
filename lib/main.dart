import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/bloc/app/app_bloc.dart';
import 'package:pos_app/bloc/utils/localizations.dart';
import 'package:pos_app/pages/splash_page.dart';
import 'package:pos_app/theme/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          title: 'POS App',
          // NOTE:May use in future
          // debugShowCheckedModeBanner: false,
          // navigatorKey: navigatorKey,
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   // useMaterial3: true,
          //   appBarTheme: const AppBarTheme(
          //     backgroundColor: Colors.red,
          //   ),
          // ),
          theme: lightMode,
          darkTheme: darkMode,
          home: const SplashPage(),
          // home: const MainPage(page: AppPage.splash),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          // supportedLocales: const [
          //   Locale('en', ''),
          //   Locale('th', ''),
          // ],
        ),
      ),
    );
  }
}
