import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/tasbehBtn.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() {
    return Sebhatabastate();
  }
}

class Sebhatabastate extends State<SebhaTab> {
  static String reading = "astaghfirullah";
  static int sebhaCount = 0;
  static int counts = 0;
  static double num = 0;

  Widget build(BuildContext context) {
    @override
    void getsebha() {
      num++;
      sebhaCount++;
      if (sebhaCount == 33 && reading == "astaghfirullah") {
        counts++;
        sebhaCount = 0;
        reading = "alhamdulillah";
      }
      if (sebhaCount == 33 && reading == "alhamdulillah") {
        sebhaCount = 0;
        reading = "subhanallah";
      }
      if (reading == "subhanallah" && sebhaCount == 33) {
        reading = "astaghfirullah";
        counts = 0;
        sebhaCount = 0;
      }
      setState(() {});
    }

    return Scaffold(
      body: Column(children: [
        Container(
          width: 520,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 150,
                child: Transform.rotate(
                  angle: 0,
                  child: Container(
                      child: Image.asset("assets/imgs/head_sebha_logo.png")),
                ),
              ),
              Positioned(
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Transform.rotate(
                        angle: num,
                        child: Container(
                            child:
                                Image.asset("assets/imgs/body_sebha_logo.png")),
                      )
                    ])),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              const Text("tasbeh counts",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB7935F),
                ),
                margin: const EdgeInsets.all(20),
                height: 81,
                width: 69,
                child: Center(
                    child: Text(
                  "$sebhaCount",
                  style: TextStyle(fontSize: 25),
                )),
              ),
              Container(
                child: Tasbehbtn(
                  tasbeh: reading,
                  onclick: getsebha,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
