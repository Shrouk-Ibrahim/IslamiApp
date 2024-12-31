import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/provider/app-configuration-provider.dart';
import 'package:provider/provider.dart';
import '../../my_theme.dart';
import 'item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {

  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if(ahadethList.isEmpty){
      loadHadethFile();
    }

    return Column(children: [
      Center(child: Image.asset('assets/images/hadeth_logo.png')),
      Divider(
        color: provider.appTheme == ThemeMode.light?
        Theme.of(context).primaryColor
            :
        MyTheme.whiteColor,
        thickness: 3,
      ),
      Text(
        AppLocalizations.of(context)!.hadeth,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Divider(
        color:provider.appTheme == ThemeMode.light?
        Theme.of(context).primaryColor
        :
            MyTheme.whiteColor,
        thickness: 3,
      ),
      ahadethList.isEmpty?
      Center(child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor ,
      ),)
          :
      Expanded(
          child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: provider.appTheme == ThemeMode.light?
            Theme.of(context).primaryColor
                :
            MyTheme.whiteColor,
            thickness: 3,
          );
        },
        itemBuilder: (context, index) {
          return ItemHadethName(hadeth: ahadethList[index]);
        },
        itemCount: ahadethList.length,
      ))
    ]);
  }

  void loadHadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {

      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0]; //title
      hadethLines.removeAt(0); // content (ahadeth )
      Hadeth hadeth = Hadeth(content: hadethLines, title: title);
      ahadethList.add(hadeth);
      setState(() {

      });

    }
  }
}

class Hadeth {
  String title;
  List<String> content;
  Hadeth({required this.content, required this.title});
}
