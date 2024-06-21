import 'package:flutter/material.dart';
import 'package:pos_app/bloc/utils/localizations.dart';
import 'package:pos_app/utils/responsive.dart';
import 'package:pos_app/widgets/active_button.dart';
import 'package:pos_app/enums/app_page.dart';
import 'package:pos_app/services/auth_service.dart';
import 'package:pos_app/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  LogInProfile logInProfile = LogInProfile(email: "", password: "");
  final bool _passwordVisible = false;

  void _navigateToPage(BuildContext context, AppPage page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page.page),
    );
  }

  void _onSubmit() {
    formKey.currentState!.save();
    formKey.currentState!.validate();
    print("email: ${logInProfile.email} password: ${logInProfile.password}");
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveLayoutUtil.isDesktop(context);
    print("a${isDesktop}");
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Container(
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
            child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 500.w : 800.w,
              maxHeight: isDesktop ? 500.h : 550.h,
            ),
            child: Card(
                color: Theme.of(context).colorScheme.surface,
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.all(50.0.w),
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
                              fontSize: PosAppTheme.defaultFontSize(
                                  isDesktop ? "Desktop" : "other"),
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                              )),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: PosAppTheme.secondaryColor,
                              )),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: PosAppTheme.errorColor,
                              )),
                              labelText:
                                  '${AppLocalizations.of(context)?.translate('emial')}',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: PosAppTheme.defaultFontSize(
                                        isDesktop ? "Desktop" : "other"),
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '${AppLocalizations.of(context)?.translate('error_input')} ${AppLocalizations.of(context)?.translate('emial')}.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          TextFormField(
                            onSaved: (String? password) {
                              logInProfile.password = password ?? "";
                            },
                            obscureText: !_passwordVisible,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontSize: PosAppTheme.defaultFontSize(
                                      isDesktop ? "Desktop" : "other"),
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                              )),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: PosAppTheme.secondaryColor,
                              )),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: PosAppTheme.errorColor,
                              )),
                              labelText:
                                  '${AppLocalizations.of(context)?.translate('password')}',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: PosAppTheme.defaultFontSize(
                                        isDesktop ? "Desktop" : "other"),
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '${AppLocalizations.of(context)?.translate('error_input')} ${AppLocalizations.of(context)?.translate('password')}.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          ActiveButton(
                              title:
                                  '${AppLocalizations.of(context)?.translate('log_in')}',
                              bgColor: PosAppTheme.primaryColor,
                              color: PosAppTheme.textColor,
                              onPressed: _onSubmit),
                          SizedBox(height: 10.h),
                          InkWell(
                            onTap: () {},
                            child: Text(
                                '${AppLocalizations.of(context)?.translate('forgot_password')}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: PosAppTheme.smallFontSize(
                                          isDesktop ? "Desktop" : "other"),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
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
                              bgColor: PosAppTheme.secondaryColor,
                              color: PosAppTheme.textColor,
                              padding: EdgeInsets.symmetric(horizontal: 50.w),
                              onPressed: () {
                                _navigateToPage(context, AppPage.register);
                              }),
                        ]),
                  ),
                )),
          ),
        )),
      ),
    );
  }
}
