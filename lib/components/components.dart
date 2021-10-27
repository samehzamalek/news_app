import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    navigateto(context, WebViewScreen(

        article['url'],
    ));

  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width:120 ,

          height:120 ,

          decoration: BoxDecoration(



              borderRadius: BorderRadius.circular(10),

              image: DecorationImage( image: article ['urlToImage']==Null ? NetworkImage('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARwAAACxCAMAAAAh3/JWAAAAA1BMVEX///+nxBvIAAAASElEQVR4nO3BMQEAAADCoPVPbQ0PoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIALA8UNAAFusnLHAAAAAElFTkSuQmCC'): NetworkImage('${article['urlToImage']} '),fit:BoxFit.cover    )

          ),



        ),

        SizedBox(

          width: 20,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(





                    '${article['title']} ',

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                    style: Theme.of(context).textTheme.bodyText1

                  ),

                ),

                Text(



                  '${article['publishedAt']} ',

                  style: TextStyle(color: Colors.grey),

                ),

              ],

            ),

          ),

        )



      ],



    ),

  ),
);

void navigateto(context,widget)=>Navigator.push(

    context,

    MaterialPageRoute(builder: (context)=>widget));