import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton(
      {super.key, this.title, this.color, this.bgColor, this.onPressed});

  final String? title;
  final Color? color;
  final Color? bgColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
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
                  fontSize: currentWidth > 768 ? 5.sp : 9.sp,
                ),
          )),
    );
  }
}
