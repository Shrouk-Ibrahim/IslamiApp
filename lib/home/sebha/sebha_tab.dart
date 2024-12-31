import 'package:flutter/material.dart';
import 'package:islami_project/my_theme.dart';
class SebhaTab extends StatefulWidget{
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}
class _SebhaTabState extends State<SebhaTab> {
  int counter = 0 ;
  int index = 0 ;
  double angle = 0 ;
  List<String> tasbehat =[
    'سبحان الله',
    'الحمد لله',
    'الله اكبر'
  ] ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child: Column(

        children: [
          Stack(alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/head_of_seb7a.png'),
              Padding(
                padding:  EdgeInsets.only(
              top: MediaQuery.of(context).size.height*0.1),
                child: GestureDetector(
                  onTap: (){
                    onTap();

                  },

                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset('assets/images/body_of_seb7a.png'))),
              ),

            ],
          ),
          Text('عدد التسبيحات',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25,),
          Container(decoration: BoxDecoration(
            color: MyTheme.primaryLight,
            borderRadius: BorderRadius.circular(24,),
            shape: BoxShape.rectangle,
          ),
            padding: EdgeInsets.all(20),
            child: Text('$counter',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24,),
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: MyTheme.primaryLight
          ),
              padding: EdgeInsets.all(15),
              child: Text(tasbehat[index],style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: MyTheme.whiteColor,

              ),)

          )
        ],
      ),
    );
  }
  void onTap(){
    counter++;
    if(counter % 33 == 0){
      index ++;
      if(index == tasbehat.length){
        index = 0;
      }
      angle += 360 / 200 ;
    }
    setState(() {

    });
  }
}