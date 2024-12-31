import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../my_theme.dart';
import '../../provider/app-configuration-provider.dart';
import 'hadeth_tab.dart';
import 'item-hadeth-details.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'HadethDetailsScreen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
          title: Text('${args.title}',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.06,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: provider.appTheme == ThemeMode.light?
                    MyTheme.whiteColor
                    :
                    MyTheme.primaryDark

            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemHadethDetails(content: args.content[index]);
              },
              itemCount: args.content.length,
            )),
      ),
    ]);
  }
}
