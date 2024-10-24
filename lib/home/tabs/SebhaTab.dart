import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int cycleCount = 0;
  String tasbeehText = 'سبحان الله';

  void incrementCounter() {
    setState(() {
      count++;

      if (count == 30) {
        cycleCount++;
        count = 0;

        if (cycleCount == 1) {
          tasbeehText = 'الله اكبر';
        } else if (cycleCount == 2) {
          tasbeehText = 'استغفر الله';
        } else {
          tasbeehText = 'سبحان الله';
          cycleCount = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 80,
              child: Image.asset(
                'assets/images/head_sebha_logo.png',
                width: 80,
              ),
            ),
            Positioned(
              top: 160,
              child: InkWell(
                onTap: incrementCounter,
                child: Image.asset(
                  'assets/images/body_sebha_logo.png',
                  width: 150,
                ),
              ),
            ),
            Positioned(
              top: 330,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'عدد التسبيحات',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffB7935F),
                    ),
                    padding: EdgeInsets.all(30),
                    child: Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xffB7935F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      tasbeehText,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
