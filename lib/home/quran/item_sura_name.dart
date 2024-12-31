import 'package:flutter/material.dart';
import 'package:islami_project/home/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../provider/app-configuration-provider.dart';

class ItemSuraName extends StatelessWidget{
String name ;
var index ;
 ItemSuraName({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
  return InkWell(
    onTap: (){
      Navigator.pushNamed(context, SuraDetailsScreen.routeName,arguments: SuraDetailsArgs(name: name, index: index));

    },
    child: Text(
      name,
      textAlign: TextAlign.center,
      style:provider.appTheme == ThemeMode.light?
      Theme.of(context).textTheme.titleSmall!.copyWith(
          color: MyTheme.blackColor)
          :
      Theme.of(context).textTheme.titleSmall!.copyWith(
        color: MyTheme.whiteColor
      )
    ),
  );
  }


}