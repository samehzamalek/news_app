import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {  },
      builder: ( context, state) {
        var cubit =NewsCubit.get(context);

        return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
            onTap: (index){
            cubit.changeBottomNavBar(index);

            },
            items:cubit.bottomItems




         ),

        appBar: AppBar(
          title: Text('News App'),
          actions: [
            IconButton(onPressed: (){
              navigateto(context, SearchScreen(),);

            }, icon: Icon(Icons.search)),
            IconButton(onPressed: (){
              AppCubit.get(context).changeAppMode();


            }, icon: Icon(Icons.brightness_4_outlined)),

          ],



        ),
          body: cubit.screens[cubit.currentIndex],


      ); },


    );
  }
}
