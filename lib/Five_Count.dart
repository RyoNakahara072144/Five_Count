import 'dart:async';
import 'package:fivecount/Next_Count.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class Five_Count extends StatefulWidget {
  const Five_Count({Key? key}) : super(key: key);

  @override
  State<Five_Count> createState() => _Five_CountState();
}

class _Five_CountState extends State<Five_Count> {
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
      time = time.add(Duration(seconds: 5));
    });
  }
  addSecond2() {
    setState(() {
      time = time.add(Duration(seconds: 10));
    });
  }addSecond3() {
    setState(() {
      time = time.add(Duration(seconds: 15));
    });
  }addSecond4() {
    setState(() {
      time = time.add(Duration(seconds: 20));
    });
  }addSecond5() {
    setState(() {
      time = time.add(Duration(seconds: 25));
    });
  }addSecond6() {
    setState(() {
      time = time.add(Duration(seconds: 30));
    });
  }addSecond7() {
    setState(() {
      time = time.add(Duration(seconds: 35));
    });
  }addSecond8() {
    setState(() {
      time = time.add(Duration(seconds: 40));
    });
  }addSecond9() {
    setState(() {
      time = time.add(Duration(seconds: 45));
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
      Widget _buildWideContainers(){//横画面
        return Center(
           child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Text(DateFormat.Hms().format(time), style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold,color: screenVanish?Colors.white:Colors.black)),
                  ),
                  // const SizedBox(height: 56),
                  
                  Container(
                  padding: EdgeInsets.fromLTRB(45, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: addSecond1, child: const Text('5S'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond2, child: const Text('10S'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond3, child: const Text('15S'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond4, child: const Text('20S'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond5, child: const Text('25S'),style: TextButton.styleFrom(primary: Colors.black)),
                        SizedBox(height: 48,),
                      ],
                    ),
                ),

                     Container(
                       child: Padding(
                         padding: EdgeInsets.fromLTRB(45, 20, 20, 0),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                              TextButton(onPressed: addSecond6, child: const Text('30S'),style: TextButton.styleFrom(primary: Colors.black)),
                              TextButton(onPressed: addSecond7, child: const Text('35S'),style: TextButton.styleFrom(primary: Colors.black)),
                              TextButton(onPressed: addSecond8, child: const Text('40S'),style: TextButton.styleFrom(primary: Colors.black)),
                              TextButton(onPressed: addSecond9, child: const Text('45S'),style: TextButton.styleFrom(primary: Colors.black)),
                               SizedBox(height: 48,),
                           ],
                         ),
                       ),
                     ),
                    // SizedBox(height: 36,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(56,20,56,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                             child: isCounting
                              ? TextButton(
                                 onPressed: stopTimer, child: const Text('Stop'),style: TextButton.styleFrom(primary: Colors.white),)
                             : TextButton(
                                 onPressed: startTimer, child: const Text('Start'),style: TextButton.styleFrom(primary: Colors.black)),
                              ),
                              
                             screenVanish?TextButton(
                                onPressed: ResetCount, child: const Text('Reset'),style: TextButton.styleFrom(primary: Colors.white)):IconButton(
                             onPressed: (){
                               Navigator.push(
                               context,
                                MaterialPageRoute(builder: (context) => const Next_Count()),);
                                }, icon: Text('▶︎'),)
                                
                        ],
                      ),
                    ), 
                ]
                
           )
        );
      }



      Widget _buildNormalContainer(){//縦画面
        return Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                 padding: const EdgeInsets.all(36.0),
                 child: Text(DateFormat.Hms().format(time), 
                 style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,color: screenVanish?Colors.white:Colors.black)
                  ),
               ),
               const SizedBox(height: 40,),

                
                Container(
                  padding: EdgeInsets.fromLTRB(45, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: addSecond1, child: const Text('5S'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond2, child: const Text('10S'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond3, child: const Text('15S'),style: TextButton.styleFrom(primary: Colors.black)),
                        SizedBox(height: 48,),
                      ],
                    ),
                ),

                     Container(
                       child: Padding(
                         padding: EdgeInsets.fromLTRB(45, 20, 20, 20),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             TextButton(onPressed: addSecond4, child: const Text('20S'),style: TextButton.styleFrom(primary: Colors.black)),
                              TextButton(onPressed: addSecond5, child: const Text('25S'),style: TextButton.styleFrom(primary: Colors.black)),
                              TextButton(onPressed: addSecond6, child: const Text('30S'),style: TextButton.styleFrom(primary: Colors.black)),
                               SizedBox(height: 48,),
                           ],
                         ),
                       ),
                     ),
                   Container(
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(45, 20, 20, 20),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           TextButton(onPressed: addSecond7, child: const Text('35S'),style: TextButton.styleFrom(primary: Colors.black)),
                            TextButton(onPressed: addSecond8, child: const Text('40S'),style: TextButton.styleFrom(primary: Colors.black)),
                          TextButton(onPressed: addSecond9, child: const Text('45S'),style: TextButton.styleFrom(primary: Colors.black)),
                          SizedBox(height: 48,),
                         ],
                       ),
                     ),
                   ),

                    SizedBox(height: 36,),
                    Center(
                       child: isCounting
                        ? TextButton(
                           onPressed: stopTimer, child: const Text('Stop'),style: TextButton.styleFrom(primary: Colors.white),)
                       : TextButton(
                           onPressed: startTimer, child: const Text('Start'),style: TextButton.styleFrom(primary: Colors.black)),
                        ),
                        SizedBox(height: 24,),

                     Center(
                       child: TextButton(
                       onPressed: ResetCount, child: const Text('Reset'),style: TextButton.styleFrom(primary: Colors.white)),
                     ),

                     IconButton(
                     onPressed: (){
                         Navigator.push(
                             context,
                            MaterialPageRoute(builder: (context) => const Next_Count()),
                       );
                     }, icon: Text('▶︎'),
                   )
                     
                     ]
           )
        );
        }
      }

      