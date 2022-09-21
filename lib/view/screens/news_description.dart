import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/news_screen.dart';
import 'package:workshop_app/view_model/news/news_cubit.dart';

import '../../model/news_model.dart';

class NewsDescription extends StatelessWidget {
  Data model;
  NewsDescription(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                navigateTo(context, layoutScreen(1));
              },
              icon: Icon(Icons.arrow_back_ios))),
      body: model != null
          ? Padding(
              padding: EdgeInsets.all(ScreenSize.width * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 3,
                      child: Image(
                    image: NetworkImage(
                      model.imageUrl.toString(),
                    ),
                    height: ScreenSize.height * .25,
                    width: double.infinity,
                  )),
                  SizedBox(
                    height: ScreenSize.height * .04,
                  ),
                  Text(
                    model.title.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: ScreenSize.height * .02,
                  ),
                  Text(
                    model.date.toString(),
                    style: TextStyle(color: defaultColor),
                  ),
                  SizedBox(
                    height: ScreenSize.height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.body.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
