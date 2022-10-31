import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SafeArea(
        child: DefaultTextStyle(
            style: TextStyle(fontFamily: "Poppins"),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                actions: [],
                title: Text("Profile"),
              ),
              body: Center(child: Text("Profile Page")),
        )));
  }
}