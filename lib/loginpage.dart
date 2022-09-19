import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/mainpage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Technical Test'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.off(MainPage());
            },
            child: Text("LOGIN"),
          ),
        ));
  }
}
