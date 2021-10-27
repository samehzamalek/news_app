import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'layout/news_app/news_layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
await  CacheHelper.init();
bool? isDark =CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool? isDark;
 MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:   (BuildContext context)=>NewsCubit()..getBusiness(),),
        BlocProvider(
            create: (BuildContext context) =>AppCubit()..changeAppMode(fromShared: isDark)),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
         listener: (context,state){},
        builder: (context,state){return MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  )
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor:Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:Colors.white,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  )

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20,
                  backgroundColor: Colors.white


              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange)


          ),
          darkTheme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  )
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: HexColor('333739'),
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarBrightness: Brightness.light
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                backgroundColor:  HexColor('333739'),
                elevation: 20,


              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange)


          ),
          themeMode:AppCubit.get(context).isDark ?  ThemeMode.dark: ThemeMode.light ,


          home: NewsLayout(),



        );},
      ),
    );



  }



}
