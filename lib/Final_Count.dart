import 'dart:async';
import 'package:fivecount/Next_Count.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class Final_Count extends StatefulWidget {
  const Final_Count({Key? key}) : super(key: key);

  @override
  State<Final_Count> createState() => _Final_CountState();
}

class _Final_CountState extends State<Final_Count> {
  late Timer timer;
  bool isCounting = false;
  bool screenVanish = false;
  DateTime time = DateTime(0);
  



  startTimer() {
    if (time.hour == 0 && time.minute == 0 && time.second == 0) {
      return;
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) {
        if (time.hour == 0 && time.minute == 0 && time.second == 0) {
          stopTimer();
          return;
        }
        setState(() {
          time = time.add(Duration(seconds: -1));
          isCounting = true;
          screenVanish = true;
        });
      },
    );
  }

  ResetCount(){
    setState(() {
      time  = DateTime(0);
    });
  }

  stopTimer() {
    timer.cancel();
    setState(() {
      isCounting = false;
      screenVanish = false;
    });
  }

  addSecond1() {
    setState(() {
      time = time.add(Duration(hours: 5));
    });
  }
  addSecond2() {
    setState(() {
      time = time.add(Duration(hours: 10));
    });
  }
  addSecond3() {
    setState(() {
      time = time.add(Duration(hours: 15));
    });
  }
  addSecond4() {
    setState(() {
      time = time.add(Duration(hours: 20));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenVanish?Colors.black:Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNormalContainer();
          }
        },
      ),
    );
  }
Widget _buildWideContainers() {
    //横画面
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
        children: [
      Container(
        decoration: BoxDecoration(
          color: screenVanish?Colors.black:Color.fromARGB(121, 77, 105, 141),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: 300,
            height: 55,
            child: Center(
              child: Text(DateFormat.Hms().format(time),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color:screenVanish?Colors.white:Colors.black,
                      )
                      ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      screenVanish?Container():
      Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 50),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: TextButton(
                        onPressed: addSecond1,
                        child: Text('5'),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color.fromARGB(121, 77, 105, 141),
                        ),
                      ),
                  ),
                  Container(
                child: TextButton(
                    onPressed: addSecond2,
                    child: const Text('10'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color.fromARGB(121, 77, 105, 141),
                    ),
                  ),
              ),
              Container(
                child: TextButton(
                    onPressed: addSecond3,
                    child: const Text('15'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color.fromARGB(121, 77, 105, 141),
                    ),
                  ),
              ),
              Container(
                  child: TextButton(
                    onPressed: addSecond4,
                    child: const Text('20'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color.fromARGB(121, 77, 105, 141),
                    ),
                  ),
                  ),
                  ],
                ),
            ],
            
          ),
        ),
      ),
           Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      screenVanish?Ink():
      Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Color.fromARGB(121, 77, 105, 141),
        ),
        child: IconButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                }, icon: Text('◀︎')),
      ) ,

           
          isCounting? TextButton(
                  onPressed: stopTimer,
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    ),
                  child: const Text('Stop'),
                ): 
                TextButton(
                  onPressed: startTimer,
                  style: TextButton.styleFrom(
                    primary: Colors.black,),
                  child: const Text('Start')
                  ),
          SizedBox(
            width: 50,
          ),
          screenVanish?TextButton(
          onPressed: ResetCount,
          style: TextButton.styleFrom(
            primary: Colors.white,
            ),
          child: const Text('Reset')
          ):
          TextButton(onPressed: ResetCount,
          style: TextButton.styleFrom(
            primary: Colors.black,
            ),
          child: const Text('Reset')
          ), 
          SizedBox(
            width: 20,
          )

        ],
      ),
      ]
      ));
}
      Widget _buildNormalContainer() {
    //縦画面
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
        children: [
      Container(
        decoration: BoxDecoration(
          color: screenVanish?Colors.black:Color.fromARGB(121, 77, 105, 141),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: 300,
            height: 150,
            child: Center(
              child: Text(DateFormat.Hms().format(time),
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                      color:screenVanish?Colors.white:Colors.black,
                      )
                      ),
            ),
          ),
        ),
      ),

      screenVanish?Container():
      Container(
        margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            // spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextButton(
                        onPressed: addSecond1,
                        child: Text('5'),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color.fromARGB(121, 77, 105, 141),
                        ),
                      ),
                  ),
                                      SizedBox(
                      width: 50,
                    ),

                  Container(
                child: TextButton(
                    onPressed: addSecond2,
                    child: const Text('10'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color.fromARGB(121, 77, 105, 141),
                    ),
                  ),
              ),
                ]
              ),

              Container(
                height:140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: TextButton(
                          onPressed: addSecond3,
                          child: const Text('15'),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            backgroundColor: Color.fromARGB(121, 77, 105, 141),
                          ),
                        ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                     Container(
                    child: TextButton(
                      onPressed: addSecond4,
                      child: const Text('20'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color.fromARGB(121, 77, 105, 141),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
             
                ],
          ))),
          
      
      
      Column(
      children: [
      screenVanish?Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: isCounting
                    ? TextButton(
                    onPressed: stopTimer,
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w200),
                      ),
                    child: const Text('Stop'),
                  )
                : TextButton(
                    onPressed: startTimer,
                    style: TextButton.styleFrom(
                      primary: Colors.black,),
                    child: const Text('Start')
                    ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
            onPressed: ResetCount,
            style: TextButton.styleFrom(
              primary: screenVanish?Colors.white:Colors.black,
              textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w200)),
            child: const Text('Reset')
            ),
          ),  
        ],
      ):Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
                child: isCounting
                    ? TextButton(
                    onPressed: stopTimer,
                    style: TextButton.styleFrom(
                      primary: Colors.white),
                    child: const Text('Stop'),
                  )
                : TextButton(
                    onPressed: startTimer,
                    style: TextButton.styleFrom(
                      primary: Colors.black,),
                    child: const Text('Start')
                    ),
               ),
               SizedBox(
                width: 30,
               ),
          Center(
            child: TextButton(
            onPressed: ResetCount,
            style: TextButton.styleFrom(
              primary: screenVanish?Colors.white:Colors.black,),
            child: const Text('Reset')
            ),
          ),  
        ],
      ),
      SizedBox(
        height: 30,
      ),
                     screenVanish?Ink(
                      
                     ):Ink(
                      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Color.fromARGB(121, 77, 105, 141),
        ),
                          child: IconButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                }, icon: Text('◀︎')),
                       
                     )
                     
                     ]
           )
    ]));
        }
      }

      