import 'package:flutter/material.dart';
import 'package:pos_app/bloc/utils/localizations.dart';
import 'package:pos_app/bloc/widgets/active_button.dart';
import 'package:pos_app/enums/app_page.dart';
import 'package:pos_app/services/auth_service.dart';
import 'package:pos_app/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  LogInProfile logInProfile = LogInProfile(email: "", password: "");

  void _navigateToPage(BuildContext context, AppPage page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page.page),
    );
  }

  void _onLogin() {
    formKey.currentState!.save();
    print("email: ${logInProfile.email} password: ${logInProfile.password}");
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      color: PosAppTheme.backgroundColor,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Login.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
            child: Container(
          width: double.infinity,
          margin: currentWidth > 768
              ? EdgeInsets.only(
                  top: 100.h, bottom: 100.h, left: 50.w, right: 50.w)
              : EdgeInsets.only(
                  top: 80.h, bottom: 80.h, left: 20.w, right: 20.w),
          child: Card(
              color: Theme.of(context).colorScheme.surface,
              child: Padding(
                padding: currentWidth > 768
                    ? EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      )
                    : EdgeInsets.only(left: 20.w, right: 20.w),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          onSaved: (String? email) {
                            logInProfile.email = email ?? "";
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)
                              .copyWith(
                            fontSize: currentWidth > 768 ? 5.sp : 10.sp,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onPrimary,
                            )),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: PosAppTheme.primaryColor,
                            )),
                            labelText:
                                '${AppLocalizations.of(context)?.translate('emial')}',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontSize: currentWidth > 768 ? 5.sp : 10.sp,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        TextFormField(
                          onSaved: (String? password) {
                            logInProfile.password = password ?? "";
                          },
                          obscureText: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontSize: currentWidth > 768 ? 5.sp : 10.sp,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onPrimary,
                            )),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: PosAppTheme.primaryColor,
                            )),
                            labelText:
                                '${AppLocalizations.of(context)?.translate('password')}',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontSize: currentWidth > 768 ? 5.sp : 10.sp,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        ActiveButton(
                            title:
                                '${AppLocalizations.of(context)?.translate('log_in')}',
                            bgColor: PosAppTheme.primaryColor,
                            onPressed: _onLogin),
                        SizedBox(height: 10.h),
                        InkWell(
                          onTap: () {},
                          child: Text(
                              '${AppLocalizations.of(context)?.translate('forgot_password')}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: currentWidth > 768 ? 4.sp : 8.sp,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  )),
                        ),
                        SizedBox(height: 30.h),
                        Divider(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        SizedBox(height: 30.h),
                        ActiveButton(
                            title:
                                '${AppLocalizations.of(context)?.translate('register')}',
                            bgColor: PosAppTheme.primaryColor,
                            onPressed: () {
                              _navigateToPage(context, AppPage.register);
                            }),
                      ]),
                ),
              )),
        )),
      ),
    );
  }
}
