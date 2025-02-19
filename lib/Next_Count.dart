import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'Final_Count.dart';

class Next_Count extends StatefulWidget {
  const Next_Count({Key? key}) : super(key: key);

  @override
  State<Next_Count> createState() => _Next_CountState();
}

class _Next_CountState extends State<Next_Count> {
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
      time = time.add(Duration(minutes: 5));
    });
  }
  addSecond2() {
    setState(() {
      time = time.add(Duration(minutes: 10));
    });
  }addSecond3() {
    setState(() {
      time = time.add(Duration(minutes: 15));
    });
  }addSecond4() {
    setState(() {
      time = time.add(Duration(minutes: 20));
    });
  }addSecond5() {
    setState(() {
      time = time.add(Duration(minutes: 25));
    });
  }addSecond6() {
    setState(() {
      time = time.add(Duration(minutes: 30));
    });
  }addSecond7() {
    setState(() {
      time = time.add(Duration(minutes: 35));
    });
  }addSecond8() {
    setState(() {
      time = time.add(Duration(minutes: 40));
    });
  }addSecond9() {
    setState(() {
      time = time.add(Duration(minutes: 45));
    });
  }
   addSecond10() {
    setState(() {
      time = time.add(const Duration(minutes: 50));
    });
  }

  addSecond11() {
    setState(() {
      time = time.add(const Duration(minutes: 55));
    });
  }

  addSecond12() {
    setState(() {
      time = time.add(const Duration(minutes: 60));
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
          color: screenVanish?Colors.black:Color.fromARGB(122, 22, 155, 146),
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
                          backgroundColor: Color.fromARGB(122, 22, 155, 146),
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
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
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
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
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
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
                    ),
                  ),
                  ),
                  Container(
                      child: TextButton(
                          onPressed: addSecond5,
                          child: const Text('25'),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            backgroundColor: Color.fromARGB(122, 22, 155, 146),
                          ),
                        ),
                    ),
                    Container(
                  child: TextButton(
                      onPressed: addSecond6,
                      child: const Text('30'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color.fromARGB(122, 22, 155, 146),
                      ),
                    ),
                  ),
                ],
              ),
              
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Container(
                  child: TextButton(
                      onPressed: addSecond7,
                      child: const Text('35'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color.fromARGB(122, 22, 155, 146),
                      ),
                    ),
                ),
                Container(
                  child: TextButton(
                      onPressed: addSecond8,
                      child: const Text('40'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color.fromARGB(122, 22, 155, 146),
                      ),
                    ),
                ),
                Container(
                child: TextButton(
                onPressed: addSecond9,
                child: const Text('45'),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Color.fromARGB(122, 22, 155, 146),
                ),
              ),
              ),
              Container(
                child: TextButton(
                onPressed: addSecond10,
                child: const Text('50'),
                style: TextButton.styleFrom(
              primary: Colors.black,
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              backgroundColor: Color.fromARGB(122, 22, 155, 146),
                ),
              ),
              ),
              Container(
                child: TextButton(
                onPressed: addSecond11,
                child: const Text('55'),
                style: TextButton.styleFrom(
              primary: Colors.black,
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              backgroundColor: Color.fromARGB(122, 22, 155, 146),
                ),
              ),
              ),
              Container(
                child: TextButton(
                onPressed: addSecond12,
                child: const Text('60'),
                style: TextButton.styleFrom(
              primary: Colors.black,
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              backgroundColor: Color.fromARGB(122, 22, 155, 146),
                ),
              ),
              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        screenVanish?Ink():Ink(
                          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Color.fromARGB(122, 22, 155, 146),
        ),
                          child: IconButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                }, icon: Text('◀︎')),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Center(
                           child: isCounting
                            ? TextButton(
                               onPressed: stopTimer, child: const Text('Stop'),style: TextButton.styleFrom(primary: Colors.white),)
                           : TextButton(
                               onPressed: startTimer, child: const Text('Start'),style: TextButton.styleFrom(primary: Colors.black)),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            
                           TextButton(
                              onPressed: ResetCount, child: const Text('Reset'),style: TextButton.styleFrom(primary: screenVanish?Colors.white:Colors.black)),
                              SizedBox(
                          width: 20,
                        ),
                              screenVanish?Ink():Ink(
                          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Color.fromARGB(122, 22, 155, 146),
        ),
                          child: IconButton(
          onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Final_Count()),
        );
          },
          icon: const Text('▶︎'),
        ),
                        ),
                              
                      ],
                    ), 
                ]
                
           )
        );
      }
Widget _buildNormalContainer() {
    //縦画面
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
        children: [
      Container(
        decoration: BoxDecoration(
          color: screenVanish?Colors.black:Color.fromARGB(122, 22, 155, 146),
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
      const SizedBox(
        height: 40,
      ),

      screenVanish?Container():
      Container(
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Wrap(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: TextButton(
                        onPressed: addSecond1,
                        child: Text('5'),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color.fromARGB(122, 22, 155, 146),
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
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
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
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
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
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
                    ),
                  ),
                  ),
                ],
              ),
              
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Container(
                      child: TextButton(
                          onPressed: addSecond5,
                          child: const Text('25'),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            backgroundColor: Color.fromARGB(122, 22, 155, 146),
                          ),
                        ),
                    ),
                    Container(
                  child: TextButton(
                      onPressed: addSecond6,
                      child: const Text('30'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color.fromARGB(122, 22, 155, 146),
                      ),
                    ),
                  ),
                Container(
                  child: TextButton(
                      onPressed: addSecond7,
                      child: const Text('35'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color.fromARGB(122, 22, 155, 146),
                      ),
                    ),
                ),
                Container(
                  child: TextButton(
                      onPressed: addSecond8,
                      child: const Text('40'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color.fromARGB(122, 22, 155, 146),
                      ),
                    ),
                ),
                  ],
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: TextButton(
                        onPressed: addSecond9,
                        child: const Text('45'),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color.fromARGB(122, 22, 155, 146),
                        ),
                      ),
                  ),
                  Container(
                child: TextButton(
                    onPressed: addSecond10,
                    child: const Text('50'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
                    ),
                  ),
              ),
              Container(
                child: TextButton(
                    onPressed: addSecond11,
                    child: const Text('55'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
                    ),
                  ),
              ),
              Container(
                child: TextButton(
                    onPressed: addSecond12,
                    child: const Text('60'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color.fromARGB(122, 22, 155, 146),
                    ),
                  ),
              ),
                ],
              ),
            ],
          ),
        ),
      ),

      
      
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

                    
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         screenVanish?Ink():Ink(
                          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Color.fromARGB(122, 22, 155, 146),
        ),
                           child: IconButton(
                               onPressed: (){
                                 Navigator.of(context).pop();
                                 }, icon: Text('◀︎')),),
                          screenVanish?Ink(
                              
                          ):Ink(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Color.fromARGB(122, 22, 155, 146),
        ),

                            child: IconButton(
                            onPressed: (){
                                Navigator.push(
                                    context,
                                   MaterialPageRoute(builder: (context) => const Final_Count()),
                              );
                            }, icon: Text('▶︎'),
                            ),)
                        ],
                )   
            ]
           )
          ]
        )
        );
        }
      }

      