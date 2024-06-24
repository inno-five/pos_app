import 'package:flutter/material.dart';
import 'package:pos_app/bloc/utils/localizations.dart';

class NumberButton extends StatefulWidget {
  const NumberButton({super.key, this.onPressed, this.title});
  final String? title;
  final VoidCallback? onPressed;
  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            border: BorderDirectional(
          top: const BorderSide(color: Colors.transparent),
          start: const BorderSide(color: Colors.transparent),
          end: widget.title == "3" ||
                  widget.title == "6" ||
                  widget.title == "9" ||
                  widget.title ==
                      "${AppLocalizations.of(context)?.translate('clear')}"
              ? const BorderSide(color: Colors.transparent)
              : BorderSide(color: Theme.of(context).colorScheme.onPrimary),
          bottom: widget.title == "" ||
                  widget.title == "0" ||
                  widget.title ==
                      "${AppLocalizations.of(context)?.translate('clear')}"
              ? const BorderSide(color: Colors.transparent)
              : BorderSide(color: Theme.of(context).colorScheme.onPrimary),
        )),
        child: Text("${widget.title}"),
      ),
    );
  }
}
