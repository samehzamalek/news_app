import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,index){},
      builder: (context,index){
        var list=NewsCubit.get(context).sports;
        return list.length>0?  ListView.separated(
            physics:BouncingScrollPhysics(),
            itemBuilder: (context,index){return buildArticleItem(list[index],context);},
            separatorBuilder: (context,index){return Divider(height: 1,color: Colors.grey[400],);},
            itemCount: 10):Center(child: CircularProgressIndicator());

      },
    );
  }
  }

