import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:islami_project/provider/app-configuration-provider.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';
class LanguageBottomSheet extends StatelessWidget {
  final void Function(String) onLanguageSelected ;
  LanguageBottomSheet({required this.onLanguageSelected});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark ;
    return Container(
      color: isDarkMode?
           MyTheme.primaryDark
          :MyTheme.primaryLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(onTap: (){
            provider.changeLanguage('en');
            onLanguageSelected('en');
          },
            child: provider.appLanguage == 'en'?
                getSelectedItemWidget(context, AppLocalizations.of(context)!.english)
                :
                  getUnselectedItemWidget(context, AppLocalizations.of(context)!.english),

          ),
          InkWell(onTap: (){
            provider.changeLanguage('ar');
            onLanguageSelected('ar');
          },
            child:provider.appLanguage == 'ar'?
               getSelectedItemWidget(context, AppLocalizations.of(context)!.arabic)
                :getUnselectedItemWidget(context, AppLocalizations.of(context)!.arabic)

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
          style: Theme.of(context).textTheme.titleMedium),
    );
  }

}
