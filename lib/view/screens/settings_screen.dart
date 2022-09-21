import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/view/componants/core/defaultButton.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/login_screen.dart';
import 'package:workshop_app/view/screens/partners_screen.dart';
import 'package:workshop_app/view/screens/support_screen.dart';

import '../../model/size_model.dart';
import '../componants/settings/list_tile.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  List<String> settings = [
    'FAQ',
    'Terms & Conditions',
    'Our Partners',
    'Support',
    'Log out'
  ];

  @override
  Widget build(BuildContext context) {
    
    List<VoidCallback> destinations = [
      () {},
      () {},
      () {
        navigateTo(context, PartnersScreen());
      },
      () {
        navigateTo(context, SupportScreen());
      },
      () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Logout'),
                content: Text('Are you sure ?'),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultButton(
                          onButtonPressed: () {
                            Navigator.pop(context);
                          },
                          buttonName: 'Cancel',
                          toggle: true,
                          height: ScreenSize.height/1.3,
                          width: ScreenSize.width / 4),
                      SizedBox(
                        width: ScreenSize.width * .06,
                      ),
                      defaultButton(
                          onButtonPressed: () {
                            navigateTo(context, LoginScreen());
                          },
                          buttonName: 'Sure',
                          height:ScreenSize. height/1.3,
                          width: ScreenSize.width / 4),
                    ],
                  ),
                ],
              ))
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  buildListTileItem(settings[index], destinations[index]),
              separatorBuilder: (context, index) => Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
              itemCount: 5),
        ));
  }
}
