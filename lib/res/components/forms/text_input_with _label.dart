import 'package:flutter/material.dart';
import '../../../utils/values/values.dart';

class TextFormInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? value;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final VoidCallback? showPasswordValue;
  final String? Function(String?)? onTapSubmitted;
  final FocusNode? focusNode;

  const TextFormInput(
      {Key? key,
      required this.placeholder,
      required this.keyboardType,
      required this.controller,
      required this.obscureText,
      required this.label,
      this.onTapSubmitted,
      this.showPasswordValue,
      this.value,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpaces.verticalSpace10,
        Text(label.toUpperCase(),
            textAlign: TextAlign.left, style: AppTextStyles.labelText),
        TextFormField(
          controller: controller,
          style: AppTextStyles.normalText,
          onFieldSubmitted: onTapSubmitted,
          focusNode: focusNode,
          keyboardType: keyboardType,
          obscureText: placeholder == 'Enter Password' ||
                  placeholder == 'Enter Choose a password'
              ? obscureText
              : obscureText,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              suffixIcon: placeholder == "Enter Password" ||
                      placeholder == "Enter Confirm Password"
                  ? InkWell(
                      onTap: showPasswordValue,
                      child: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        size: 18,
                        color: Colors.black,
                      ))
                  : InkWell(
                      onTap: () {
                        controller.text = "";
                      },
                      child: const Icon(Icons.clear,
                          size: 18, color: Colors.black),
                    ),
              hintText: placeholder,
              hintStyle: AppTextStyles.hintText,
              filled: false,
              errorStyle: AppTextStyles.errorText,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.brown),
              ),
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
        ),
      ],
    );
  }
}
