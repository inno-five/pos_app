import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/enums/app_page.dart';

// class MainPage extends StatefulWidget {
//   final AppPage page;
//   final bool hideBottom;
//   final String? title;
//   const MainPage(
//       {super.key, required this.page, this.hideBottom = false, this.title});
//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   late AppPage _selectedPage;
//   bool _isKeyboardVisible = false;
//   bool _hideBottom = false;
//   @override
//   void initState() {
//     super.initState();
//     _selectedPage = widget.page;
//     _hideBottom = widget.hideBottom;
//   }

//   void _onPageSelected(AppPage page) {
//     setState(() {
//       _selectedPage = page;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class MainPage extends StatefulWidget {
  final AppPage page;
  final bool hideBottom;
  final String? title;
  const MainPage(
      {super.key, required this.page, this.hideBottom = false, this.title});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AppPage _selectedPage;
  bool _hideBottom = false;
  @override
  void initState() {
    super.initState();
    _selectedPage = widget.page;
    _hideBottom = widget.hideBottom;

    // _navigateToPage(_selectedPage ?? AppPage.login);
  }

  void _onPageSelected(AppPage page) {
    setState(() {
      _selectedPage = page;
    });
  }

  // void _navigateToPage(AppPage page) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => page.page),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.redAccent,
        title: const Center(
          child: Text(
            'POS APP ',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        // NOTE:May use in future
        padding: EdgeInsets.only(top: 50.h),
        width: double.infinity,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.blue, Colors.green],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
        child: Container(
          margin: EdgeInsets.only(bottom: !_hideBottom ? 30 : 0),
          child: _selectedPage.page,
        ),
      ),
    );
  }
}
