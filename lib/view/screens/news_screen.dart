import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/main.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/news_description.dart';
import 'package:workshop_app/view/screens/sections_screen.dart';
import 'package:workshop_app/view_model/news/news_cubit.dart';
import 'package:workshop_app/view_model/news/news_states.dart';

import '../../model/news_model.dart';
import '../../model/size_model.dart';
import '../componants/news/news_item.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.initScreenSize(context);

    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
        title: Text('News'),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocProvider(
lazy:true,
          create: (context) => NewsCubit()..getNews(),
          child: BlocConsumer<NewsCubit,NewsStates>(
            listener: (context, state) {
              
            },
            builder: (context, state) {
              NewsCubit cubit= NewsCubit.get(context);
              return cubit.newsModel!=null?  ListView.separated(itemBuilder: (context, index
              ) =>buildNewsItem(cubit.newsModel!.data![index].imageUrl.toString(),
              cubit.newsModel!.data![index].title.toString(),
              cubit.newsModel!.data![index].body.toString(),
              context,
              cubit.newsModel!.data![index]
              ) ,
               separatorBuilder: (context, index) => SizedBox(height: ScreenSize.height*.03,),
                itemCount: cubit.newsModel!.data!.length
                ):Center(child: CircularProgressIndicator(),);
            },
            
          ),
        ),
      ),
      
    );
  }
}

