import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../my_theme.dart';
import '../../provider/app-configuration-provider.dart';
import 'item-sura-details.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    loadFile(args.index);
    return Stack(children: [
      provider.appTheme == ThemeMode.light
          ? Image.asset(
        'assets/images/main_background.png',
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      )
          : Image.asset(
        'assets/images/main_background_dark.png',
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text('${args.name}',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: verses.length == 0
            ? Center(child: CircularProgressIndicator())
            : Container(
          padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.06,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: provider.appTheme == ThemeMode.light?
                  MyTheme.whiteColor
                      :
                  Theme.of(context).primaryColor

                ),
                child: ListView.separated(   separatorBuilder: (context, index) {
                  return  Divider(
                    color:provider.appTheme == ThemeMode.light?
                    Theme.of(context).primaryColor
                    :
                        MyTheme.whiteColor
                    ,
                    thickness: 3,
                  );
                },
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(content: verses[index],index: index
                        ,);
                    },
                    itemCount: verses.length),
              ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');

    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;
  SuraDetailsArgs({required this.name, required this.index});
}
