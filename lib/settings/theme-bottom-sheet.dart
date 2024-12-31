import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project/provider/app-configuration-provider.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';
class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color:isDarkMode? MyTheme.primaryDark:MyTheme.primaryLight ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(onTap: (){
            provider.changeTheme(ThemeMode.dark);
          },
            child: provider.appTheme == ThemeMode.dark?
                getSelectedItemWidget(context, AppLocalizations.of(context)!.dark)
                :
                  getUnselectedItemWidget(context, AppLocalizations.of(context)!.dark)
          ),
          InkWell(onTap: (){
            provider.changeTheme(ThemeMode.light);
          },
            child:provider.appTheme == ThemeMode.light?
               getSelectedItemWidget(context, AppLocalizations.of(context)!.light)
                :getUnselectedItemWidget(context, AppLocalizations.of(context)!.light)

          ),
        ],
      ),
    );
  }
   Widget getSelectedItemWidget(BuildContext context ,String text){
    return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(text,
               style: Theme.of(context).textTheme.titleMedium?.copyWith(
                   color: Theme.of(context).primaryColor
               )),
           Icon(Icons.check,   color: Theme.of(context).primaryColor,size: 30,)
         ],
       ),
     );
}
  Widget getUnselectedItemWidget(BuildContext context ,String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
          style: Theme.of(context).textTheme.titleMedium,),
    );
  }

}
