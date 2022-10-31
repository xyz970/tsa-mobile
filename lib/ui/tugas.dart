import 'package:flutter/material.dart';

class Tugas extends StatefulWidget {
  Tugas({Key? key}) : super(key: key);

  @override
  _TugasState createState() => _TugasState();
}

class _TugasState extends State<Tugas> {
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Card(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 0, 123, 255),
                      Color.fromARGB(255, 57, 164, 252),
                      Color.fromARGB(255, 117, 193, 255)
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 4,
                child: Stack(
                  children: [
                    Positioned(
                        left: 20,
                        top: 10,
                        child: Text("Muhammad Adi Saputro",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.white))),
                    Positioned(
                        left: 20,
                        top: 40,
                        child: Text("It's cloudy day right?",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                                color: Colors.white))),
                    Positioned(
                      top: 35,
                      right: 10,
                      child: Container(
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.yellowAccent[400],
                          ),
                          width: 60,
                          height: 60),
                    ),
                    // Positioned(
                    //   right: -12,
                    //   top: 0,
                    //   child: Container(
                    //       decoration: ShapeDecoration(
                    //         shape: CircleBorder(),
                    //         color: Colors.white,
                    //       ),
                    //       width: 40,
                    //       height: 40),
                    // ),
                    Positioned(
                      right: -1,
                      top: 5,
                      bottom: 0,
                      child:
                          Container(color: Colors.white, width: 12, height: 40),
                    ),
                    Positioned(
                      top: 26,
                      right: 2,
                      child: Container(
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
                          ),
                          width: 80,
                          height: 80),
                    ),
                    Positioned(
                      top: -25,
                      right:-5,
                      child: Container(
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
                          ),
                          width: 60,
                          height: 60),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -5,
                      child: Container(
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
                          ),
                          width: 60,
                          height: 60),
                    ),
                    Positioned(
                      right: 60,
                      top: 90,
                      bottom: -30,
                      child: Container(
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
                          ),
                          width: 60,
                          height: 60),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
