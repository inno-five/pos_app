import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/enums/app_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // TODO:fetch user data
    final userData = {"name": "dsdsdsds"};
    //  final userData = {};
    // NOTE:May use in future
    // Simulate some loading time (optional)
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to login page after delay
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => AppPage.login),
      // );
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //       // builder: (context) => const MainPage(page: AppPage.login)));
      //       builder: (context) => const MainPage(page: AppPage.login)));
      // });
      // Navigator.of(context).push(MaterialPageRoute(
      //     // builder: (context) => const MainPage(page: AppPage.login)));
      //     builder: (context) => const MainPage(page: AppPage.login)));

      Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) => const MainPage(page: AppPage.login)));
          builder: (context) =>
              userData.isNotEmpty ? AppPage.pin.page : AppPage.login.page));
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: isDarkMode
            ? const AssetImage('assets/images/dark.png')
            : const AssetImage('assets/images/light.png'),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Text('POS APP',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold)),
      ),
    );
    // bode: BlocListener<>(),
  }
}
