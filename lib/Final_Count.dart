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
      Widget _buildWideContainers(){//横画面
        return Center(
           child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(DateFormat.Hms().format(time), style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold,color: screenVanish?Colors.white:Colors.black)),
                  ),
                  // const SizedBox(height: 56),
                  
                  Container(
                  padding: EdgeInsets.fromLTRB(45, 32, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: addSecond1, child: const Text('5h'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond2, child: const Text('10h'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond3, child: const Text('15h'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond4, child: const Text('20h'),style: TextButton.styleFrom(primary: Colors.black)),
                        SizedBox(height: 72,),
                      ],
                    ),
                ),
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
                               Navigator.of(context).pop();
                                }, icon: Text('◀︎'),)
                                
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
               const SizedBox(height: 56,),

                
                Container(
                  padding: EdgeInsets.fromLTRB(55, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: addSecond1, child: const Text('5h'),style: TextButton.styleFrom(primary: Colors.black)),
                        TextButton(onPressed: addSecond2, child: const Text('10h'),style: TextButton.styleFrom(primary: Colors.black)),
                        SizedBox(height: 48,),
                      ],
                    ),
                ),

                     Container(
                       child: Padding(
                         padding: EdgeInsets.fromLTRB(55, 20, 20, 20),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             TextButton(onPressed: addSecond3, child: const Text('15h'),style: TextButton.styleFrom(primary: Colors.black)),
                             TextButton(onPressed: addSecond4, child: const Text('20h'),style: TextButton.styleFrom(primary: Colors.black)),
                               SizedBox(height: 72,),
                           ],
                         ),
                       ),
                     ),
                   
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
                     SizedBox(height: 72,),

                     IconButton(
                     onPressed: (){
                         Navigator.of(context).pop();
                     }, icon: Text('◀︎'),
                   )
                     
                     ]
           )
        );
        }
      }

      