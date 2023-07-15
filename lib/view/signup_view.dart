import '../utils/utils.dart';
import '../utils/values/values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/routes/routes_name.dart';
import '../res/components/buttons/buttons.dart';
import '../res/components/forms/text_input_with _label.dart';
import '../view_model/auth_view_model/signup_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  ValueNotifier<bool> obscureNotifier = ValueNotifier(true);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupViewModel>(context);
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Flutter MVVM",
          style: AppTextStyles.header,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              title(),
              AppSpaces.verticalSpace20,
              TextFormInput(
                label: "Email",
                controller: email,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                placeholder: "Enter Email",
                focusNode: emailFocusNode,
                onTapSubmitted: (val) => Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode),
              ),
              AppSpaces.verticalSpace10,
              ValueListenableBuilder(
                  valueListenable: obscureNotifier,
                  builder: (context, value, child) => TextFormInput(
                      label: "Password",
                      controller: password,
                      obscureText: obscureNotifier.value,
                      keyboardType: TextInputType.text,
                      placeholder: "Enter Password",
                      focusNode: passwordFocusNode,
                      showPasswordValue: () {
                        obscureNotifier.value = !obscureNotifier.value;
                      })),
              AppSpaces.verticalSpace20,
              Button(
                title: 'Signup',
                loading: signupViewModel.isLoading,
                onPress: () {
                  if (email.text.isEmpty) {
                    Utils.flushBar("Enter Email", context);
                  } else if (password.text.isEmpty) {
                    Utils.flushBar("Enter Password", context);
                  } else if (password.text.length < 6) {
                    Utils.flushBar(
                        "Password length should be less than 6", context);
                  } else {
                    Map data = {
                      "email": email.text.toString(),
                      "password": password.text.toString()
                    };
                    signupViewModel.signupApi(data, context);
                  }
                },
              ),
              AppSpaces.verticalSpace10,
              RichText(
                text: TextSpan(
                  text: "Already have an account",
                  style: AppTextStyles.normalText,
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Navigator.pushNamed(context, RoutesName.login),
                      text: " Login",
                      style: AppTextStyles.boldText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'Signup Screen',
      style: AppTextStyles.titleText,
    );
  }
}
