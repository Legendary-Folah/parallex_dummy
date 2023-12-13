import 'package:flutter/material.dart';


class ParallexTextButton extends StatelessWidget {
  const ParallexTextButton({Key? key,required this.onPressed, this.style,required this.child}):super(key: key);

  final Function? onPressed;
  final ButtonStyle? style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 60,
      child: TextButton(
        onPressed:(){
          if (onPressed!=null) {
            onPressed!();
          }
        },
        style: style,
        child: child,
      ),
    );
  }
}