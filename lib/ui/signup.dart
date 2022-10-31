import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            //Blue Cloud
            Container(
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  Container(
                      color: Theme.of(context).colorScheme.primary,
                      width: 40,
                      height: 37),
                  Positioned(
                    left: 0,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 30,
                        height: 30),
                  ),
                  Positioned(
                    left: 10,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 40,
                        height: 40),
                  ),
                  Positioned(
                    left: -19,
                    top: 30,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 40,
                        height: 40),
                  ),
                  Positioned(
                    left: 30,
                    top: -30,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 60,
                        height: 60),
                  ),
                  Positioned(
                    left: 70,
                    top: -50,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 60,
                        height: 60),
                  )
                ],
              ),
            ),
            //End Blue Cloud

            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 10,
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(CupertinoIcons.left_chevron,
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                    Text(
                      "Daftar",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      "Dimohon mengisi kolom dibawah ini",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 11,
                          // fontWeight: FontWeight,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Nama Depan",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(Icons.person,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        // hintText: "xx",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Nama Belakang",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(Icons.person,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        // hintText: "xx",
                        hintStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.grey,
                            fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Email",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(FontAwesomeIcons.at,
                        size: 20, color: Theme.of(context).colorScheme.primary),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        focusColor: Theme.of(context).colorScheme.primary,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'ex@gmail.com',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Password",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(Icons.lock_open,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  new Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: '*******',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 18,
                  margin: const EdgeInsets.only(top: 20.0),
                  // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "DAFTAR",
                      // style:
                      //     TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                  )),
            ),

            //Blue Cloud
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 5,
              child: Stack(
                children: [
                  //  Positioned(
                  //    right: 0,
                  //    child: Container(
                  //          color: Theme.of(context).colorScheme.primary,
                  //         width: 30,
                  //         height: 30),
                  //  ),
                  Positioned(
                    right: -12,
                    top: 0,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 40,
                        height: 40),
                  ),
                  Positioned(
                    right: 0,
                    top: 2,
                    bottom: 0,
                    child: Container(
                        color: Theme.of(context).colorScheme.primary,
                        width: 12,
                        height: 40),
                  ),
                  Positioned(
                    top: 16,
                    right: 2,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 40,
                        height: 40),
                  ),

                  Positioned(
                    right: -10,
                    bottom: 30,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 40,
                        height: 40),
                  ),
                  Positioned(
                    right: 20,
                    bottom: -50,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 80,
                        height: 80),
                  ),
                  Positioned(
                    right: 0,
                    bottom: -5,
                    child: Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 60,
                        height: 60),
                  )
                ],
              ),
            ),
            //End Blue Cloud
          ],
        ),
      ),
    );
  }
}
