import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/cache_helper.dart';

class AppCubit extends Cubit <AppStates>{
  AppCubit( ) : super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  bool isDark =false;

  void changeAppMode({  bool? fromShared}){
    if(fromShared !=null){

      isDark=fromShared;
      emit(AppAppChangeModeState());
    }

    else
      {
        isDark=!isDark;
        CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
          emit(AppAppChangeModeState());

        });

      }

  }



}