import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {

  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
    int counter = 0;
    double turns = 0;
    int index = 0;
    List<String> ad3ia = ["الحمدلله","سبحان الله","الله اكبر","لا اله الا الله"];
  @override
  Widget build(BuildContext context) {
    double rotation = -3.1415926535897932;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: width*0.27),
                      child:
                      Image.asset("assets/images/head_sebha_logo.png",)
                  ),
                  Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.only(top: height*0.09),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          turns+=1/16;
                          is30();
                        });
                      },
                      child: AnimatedRotation(
                          turns: turns,
                          duration: Duration(milliseconds: 200),
                          child: Image.asset("assets/images/body_sebha_logo.png",),
                      ),
                    ),

                    // Image.asset("assets/images/body_sebha_logo.png")
                  ),
                ]
            ),
          ),
          SizedBox(height: height*0.05,),
          Text("عدد التسبيحات",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(height: height*0.02,),
          Container(
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.65),
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text("$counter", style: TextStyle(fontSize: 30),),
          ),
          SizedBox(height: height*0.02 ,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3,horizontal: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30)
            ),
            child: Text(ad3ia[index], style: TextStyle(fontSize: 30, color: Colors.white),),
          )

        ],
      ),
    );

  }
    void is30 (){
      counter++;
      if(counter > 30) {
        counter = 0;
        (index<3)?(index++):(index = 0);
        return;
    }
  }
}
