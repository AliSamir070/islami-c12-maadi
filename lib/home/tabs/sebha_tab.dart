import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  final List<String> tasbeeh = ['سبحان اللّه', 'الحمد للّه', 'اللّه اكبر'];
  int counter = 0;
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        children: [
          buildSebhaImages(height),
          SizedBox(height: height * 0.04),
          buildTextLabel('عدد التسبيحات', 25, FontWeight.w600),
          SizedBox(height: height * 0.02),
          buildCounterDisplay(height),
          SizedBox(height: height * 0.02),
          buildTasbeehButton(height),
        ],
      ),
    );
  }

  Widget buildSebhaImages(double height) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(left: height * 0.05),
          child: Image.asset('assets/images/head_sebha_logo.png'),
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.09),
          child: Transform.rotate(
            angle: angle,
            child: Image.asset(
              height: height * 0.25,
              'assets/images/body_sebha_logo.png',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextLabel(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget buildCounterDisplay(double height) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: height * 0.02,
        vertical: height * 0.03,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(height * 0.03),
      ),
      child: Text(
        counter.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget buildTasbeehButton(double height) {
    return InkWell(
      onTap: onTasbeeh,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: height * 0.02,
          vertical: height * 0.01,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(height * 0.05),
        ),
        child: Text(
          ' ${tasbeeh[index]}',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void onTasbeeh() {
    setState(() {
      angle += 0.10;
      if (counter < 33) {
        counter++;
      } else {
        counter = 0;
        index = (index + 1) % tasbeeh.length;
      }
    });
  }
}
