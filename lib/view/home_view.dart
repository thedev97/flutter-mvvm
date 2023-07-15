import '../utils/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/user_view_model/user_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<UserViewModel>(context);
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
        actions: [
          TextButton(
              onPressed: () {
                homeViewModel.removeUser().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                }).onError((error, stackTrace) {
                  if (kDebugMode) {
                    print(error.toString());
                  }
                });
              },
              child: Text(
                'Logout',
                style: AppTextStyles.normalText2,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'Home',
            style: AppTextStyles.titleText,
          ),
        ),
      ),
    );
  }
}
