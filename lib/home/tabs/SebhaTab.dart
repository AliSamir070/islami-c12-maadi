import 'package:flutter/material.dart';
import 'dart:math' as math;

class TasbeehScreen extends StatefulWidget {
  @override
  SebhaTab createState() => SebhaTab();
}

class SebhaTab extends State<TasbeehScreen> with SingleTickerProviderStateMixin {
  int tasbeehCount = 0;
  int tasbeehIndex = 0;
  final List<String> tasbeehs = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void incrementTasbeeh() {
    setState(() {
      tasbeehCount++;

      if (tasbeehCount % 33 == 0) {
        tasbeehIndex = (tasbeehIndex + 1) % tasbeehs.length;
      }
    });
    controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/header.png',
                        width: 100,
                        height: 100,
                      ),
                      Transform.translate(
                        offset: Offset(0, 110),
                        child: GestureDetector(
                          onTap: incrementTasbeeh,
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: controller.value * 0.1 * math.pi,
                                child: Image.asset(
                                  'assets/images/mainsebha.png',
                                  width: 232,
                                  height: 234,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 120),
                  Text(
                    'عدد التسبيحات',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffB7935F).withOpacity(0.57),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '$tasbeehCount',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: incrementTasbeeh,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffB7935F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      tasbeehs[tasbeehIndex],
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
