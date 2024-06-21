import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/bloc/utils/localizations.dart';
import 'package:pos_app/utils/responsive.dart';
import 'package:pos_app/widgets/active_button.dart';
import 'package:pos_app/enums/app_page.dart';
import 'package:pos_app/services/auth_service.dart';
import 'package:pos_app/services/bussiness_service.dart';
import 'package:pos_app/theme/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  RegisterProfile logInProfile = RegisterProfile(
      email: "", password: "", bussinessName: "", bussinessType: "");

//   const List<BussinessType> bussinessTypes = <BussinessType>[
// {}
//   ];

  bool _passwordVisible = false;
  bool isChecked = false;
  String? selectedValue;

  void _onSubmit() {
    formKey.currentState!.save();
    formKey.currentState!.validate();
    logInProfile.bussinessType = selectedValue!;
    print(
        "email: ${logInProfile.email} password: ${logInProfile.password} bussinessType: ${logInProfile.bussinessType}");
  }

  void _navigateToPage(BuildContext context, AppPage page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page.page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveLayoutUtil.isDesktop(context);

    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: isDarkMode
              ? const AssetImage('assets/images/dark.png')
              : const AssetImage('assets/images/light.png'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Card(
              color: Theme.of(context).colorScheme.surface,
              child: Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(50.0.w),
                  constraints: BoxConstraints(
                    maxWidth: isDesktop ? 500.w : 800.w,
                    maxHeight: isDesktop ? 670.h : 700.h,
                  ),
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
                        SizedBox(height: 20.h),
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
                              suffixIcon: IconButton(
                                  icon: _passwordVisible
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  })),
                          validator: (value) {
                            print(value);
                            if (value == null || value.isEmpty) {
                              return '${AppLocalizations.of(context)?.translate('error_input')} ${AppLocalizations.of(context)?.translate('password')}.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          onSaved: (String? bussinessName) {
                            logInProfile.bussinessName = bussinessName ?? "";
                          },
                          obscureText: !_passwordVisible,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
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
                                '${AppLocalizations.of(context)?.translate('bussinessName')}',
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
                            print(value);
                            if (value == null || value.isEmpty) {
                              return '${AppLocalizations.of(context)?.translate('error_input')} ${AppLocalizations.of(context)?.translate('bussinessName')}.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText:
                                '${AppLocalizations.of(context)?.translate('bussinessType')}',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontSize: PosAppTheme.defaultFontSize(
                                      isDesktop ? "Desktop" : "other"),
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
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
                          ),
                          value: selectedValue,
                          items: ["ร้านอาหาร", "ร้านขายของชำ"].map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() {
                                selectedValue = value;
                              });
                              print(
                                  value); // Perform any additional actions when an item is selected
                            }
                          },
                          validator: (value) {
                            print(value);
                            if (value == null || value.isEmpty) {
                              return '${AppLocalizations.of(context)?.translate('error_input')} ${AppLocalizations.of(context)?.translate('bussinessType')}.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.h),
                        Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Checkbox(
                              checkColor:
                                  isDarkMode ? Colors.white : Colors.black,
                              activeColor: Colors.transparent,
                              side: WidgetStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        width: 1.5,
                                      )),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                                '${AppLocalizations.of(context)?.translate('accept_terms')}',
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
                            InkWell(
                              onTap: () {},
                              child: Text(
                                  '${AppLocalizations.of(context)?.translate('service')}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: PosAppTheme.smallFontSize(
                                            isDesktop ? "Desktop" : "other"),
                                        fontWeight: FontWeight.bold,
                                        color: PosAppTheme.linkColor,
                                      )),
                            ),
                            Text(
                                '${AppLocalizations.of(context)?.translate('and')}',
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
                            InkWell(
                              onTap: () {},
                              child: Text(
                                  '${AppLocalizations.of(context)?.translate('policy')}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: PosAppTheme.smallFontSize(
                                            isDesktop ? "Desktop" : "other"),
                                        fontWeight: FontWeight.bold,
                                        color: PosAppTheme.linkColor,
                                      )),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        ActiveButton(
                            title:
                                '${AppLocalizations.of(context)?.translate('register')}',
                            bgColor: !isChecked
                                ? Colors.grey
                                : PosAppTheme.secondaryColor,
                            color: PosAppTheme.textColor,
                            onPressed: isChecked ? _onSubmit : null),
                        SizedBox(height: 20.h),
                        Divider(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        SizedBox(height: 20.h),
                        ActiveButton(
                            title:
                                '${AppLocalizations.of(context)?.translate('log_in')}',
                            bgColor: PosAppTheme.primaryColor,
                            color: PosAppTheme.textColor,
                            padding: EdgeInsets.symmetric(horizontal: 50.w),
                            onPressed: () {
                              _navigateToPage(context, AppPage.login);
                            }),
                      ]),
                ),
              )),
        ),
      ),
    );
  }
}
