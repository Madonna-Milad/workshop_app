import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';

import '../componants/core/navigation.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: () {
          navigateTo(context,layoutScreen(2));
        },),
        title: Text('Terms & Conditions'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
    
  }
}