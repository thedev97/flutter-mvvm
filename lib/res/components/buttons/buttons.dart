import 'package:flutter/material.dart';
import '../../../utils/values/values.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;

  const Button(
      {Key? key,
      required this.title,
      required this.onPress,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: ElevatedButton(
          onPressed: onPress,
          style: ButtonStyles.primaryDecoration,
          child: Center(
            child: loading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 1,
                    ),
                  )
                : Text(
                    'Login',
                    style: AppTextStyles.normalText2,
                  ),
          )),
    );
  }
}
