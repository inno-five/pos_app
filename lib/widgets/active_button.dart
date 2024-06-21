import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/theme/theme.dart';
import 'package:pos_app/utils/responsive.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton(
      {super.key,
      this.title,
      this.color,
      this.bgColor,
      this.onPressed,
      this.padding});

  final String? title;
  final Color? color;
  final Color? bgColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveLayoutUtil.isDesktop(context);
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 30.w),
      padding: padding,

      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: PosAppTheme.defaultFontSize(
                      isDesktop ? "Desktop" : "other"),
                ),
          )),
    );
  }
}
