import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbeeh = [
    'سبحان اللّه',
    'الحمد للّه',
    'اللّه اكبر',
  ];
  int counter = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/Group 7.png'),
              Padding(
                padding: EdgeInsets.only(top: height * 0.09),
                child: Image.asset(
                  height: height * 0.25,
                  'assets/images/Group 7.png',
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.04,
          ),
          const Text(
            'عدد التسبيحات',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: height * 0.02,
              vertical: height * 0.03,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffC8B395),
              borderRadius: BorderRadius.circular(height * 0.03),
            ),
            child: Text(
              counter.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: onTasbeeh,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffB7935F),
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
          ),
        ],
      ),
    );
  }

  onTasbeeh() {
    if (counter < 33) {
      counter++;
    } else {
      counter = 0;
      index++;
      if (index == tasbeeh.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
