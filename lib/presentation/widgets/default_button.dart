import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.child,
    required this.onPress,
  }) : super(key: key);
  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: Colors.orange.shade600,
        ),
        onPressed: onPress as void Function(),
        child: child,
      ),
    );
  }
}
