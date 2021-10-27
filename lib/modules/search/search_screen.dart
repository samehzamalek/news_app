import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

class SearchScreen extends StatelessWidget {
 
var searchController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
   listener: (context,state){},
   builder: (context,state){
     var list=NewsCubit.get(context).search;
     return  Scaffold(
       appBar: AppBar(),
       body: Column(
         children: [

           Padding(
             padding: const EdgeInsets.all(20.0),
             child: TextFormField(

               controller:searchController ,
               keyboardType: TextInputType.text,
               validator: (value){
                 if (value!.isEmpty)
                 {
                   return 'search must not be empty';
                 }
                 return null;
               },
               onChanged:(value){
               NewsCubit.get(context).getSearch( value);
               } ,
               decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10) ),


                   labelText: 'search',
                   prefix: Icon(Icons.search)

               ),
             ),
           ),
    Expanded(
      child: ListView.separated(
       physics:BouncingScrollPhysics(),
       itemBuilder: (context,index){return list.length>0? buildArticleItem(list[index],context):Center(child:Container ());},
       separatorBuilder: (context,index){return Divider(height: 1,color: Colors.grey[400],);},
       itemCount: 10),
    ) ,


         ],

       ),


     );
   },
    );
  }
}
