import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/bloc/utils/localizations.dart';
import 'package:pos_app/utils/responsive.dart';
import 'package:pos_app/widgets/number_button.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  late List<String> titleButton;
  String? clearButtonText;
  late List<String> pins;
  List<int> pinsIndex = [];
  @override
  void initState() {
    super.initState();
    pins = [];
    titleButton = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      clearButtonText = AppLocalizations.of(context)?.translate('clear');
      setState(() {
        titleButton = [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "",
          "0",
          clearButtonText ?? ''
        ];
        pins = [];
      });
    });
  }

  void _onPressed(int index) {
    setState(() {
      if (titleButton[index] == clearButtonText) {
        pins.clear();
        pinsIndex.clear();
      } else if (titleButton[index] != "" && pins.length < 4) {
        pins.add(titleButton[index]);
        pinsIndex.add(index);
        if (pins.length == 4) {
          print(pins);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveLayoutUtil.isTablet(context);
    final isDesktop = ResponsiveLayoutUtil.isDesktop(context);
    return Container(
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.surface,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20.h),
        child: Card(
            margin: EdgeInsets.all(10.h),
            color: Theme.of(context).colorScheme.surface,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      '${AppLocalizations.of(context)?.translate('enter_pin')}'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (int index) {
                      return Container(
                        width: 20.w,
                        height: 20.w,
                        margin: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: pins.isEmpty || pins.length <= index
                              ? Colors.transparent
                              : Colors.red,
                          border: Border.all(color: Colors.red),
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  isDesktop || isTablet
                      ? Expanded(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            children: List.generate(12, (index) {
                              return NumberButton(
                                title: titleButton.isNotEmpty
                                    ? titleButton[index]
                                    : "",
                                onPressed: () {
                                  _onPressed(index);
                                },
                              );
                            }),
                          ),
                        )
                      : GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          children: List.generate(12, (index) {
                            return NumberButton(
                              title: titleButton.isNotEmpty
                                  ? titleButton[index]
                                  : "",
                              onPressed: () {
                                _onPressed(index);
                              },
                            );
                          }),
                        ),
                ])));
  }
}
