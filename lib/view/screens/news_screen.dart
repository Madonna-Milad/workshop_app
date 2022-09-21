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

Widget buildNewsItem(String imageUrl,String title,String body,BuildContext context,Data model){
  return GestureDetector(
    onTap: (){
      navigateTo(context, NewsDescription(model));
    },
    child: Column(
                children: [
                  Container(
                   
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: ScreenSize.width * .9,
                    height: ScreenSize.height * .3,
                    child: Stack(
                      children: [
                       ColorFiltered(colorFilter: ColorFilter.mode(Color.fromARGB(255, 214, 213, 213), 
                       BlendMode.modulate,),
                       child:  Image(image: NetworkImage(imageUrl,)
                       ,fit: BoxFit.cover,
                        width:ScreenSize.width*.9 ,
                        height: ScreenSize.height*.3,
                       
                        ) ,
                       ),
                      
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                        color: defaultColor,
                                      
                                    ),
                                    height: ScreenSize.height*.05,
                                    width: ScreenSize.width*.2,
                                  child: Row(children: [
                                    Expanded(child: Icon(Icons.share_outlined,color: Colors.white,size: 16,)),
                                    Container(width: 1,height: ScreenSize.height*.03,color: Colors.white,),
                                  Expanded(child: Icon(Icons.copy,color: Colors.white,size :16))  
                                  ],),
                                  ),
                    
                    
                                ],
                                
                              ),
                               Spacer(),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text(body,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500,),textAlign: TextAlign.start,),
                                 ],
                               )
                            ],
                            
                          ),
                        ),
                       
                    
                      ],
                    ),
                  ),
                    
                 
                ],
              ),
  );
}