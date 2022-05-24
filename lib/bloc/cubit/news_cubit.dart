import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/dio_helper.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  List business = [];
  List entertainment = [];
  List general = [];
  List health = [];
  List science = [];
  List sports = [];
  List technology = [];

////////************************************************/////////

  void getBusiness() {
    emit(BusinessloadingState());
    DioHelper.getData(
      url: "/v2/top-headlines",
      query: {
        "country": "eg",
        "category": "business",
        "apiKey": "e112c1ba8cb24f99ac563837dbf1083e",
      },
    ).then((value) {
      emit(BusinessSuccessState());
      business = value.data['articles'];
      print(business.toString());
    }).catchError((error) {
      emit(BusinessErrorState(error.toString()));
      print(error.toString());
    });
  }

////////************************************************/////////

  void getSports() {
    emit(SportsloadingState());
    DioHelper.getData(
      url: "/v2/top-headlines",
      query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "e112c1ba8cb24f99ac563837dbf1083e",
      },
    ).then((value) {
      emit(SportsSuccessState());
      sports = value.data['articles'];
    }).catchError((error) {
      emit(SportsErrorState(error.toString()));
      print(error.toString());
    });
  }

////////************************************************/////////
  void getHealth() {
    emit(HealthloadingState());
    DioHelper.getData(
      url: "/v2/top-headlines",
      query: {
        "country": "eg",
        "category": "health",
        "apiKey": "e112c1ba8cb24f99ac563837dbf1083e",
      },
    ).then((value) {
      emit(HealthSuccessState());
      health = value.data['articles'];
    }).catchError((error) {
      emit(HealthErrorState(error.toString()));
      print(error.toString());
    });
  }

////////************************************************/////////

  void getGeneral() {
    emit(GeneralloadingState());
    DioHelper.getData(
      url: "/v2/top-headlines",
      query: {
        "country": "eg",
        "category": "general",
        "apiKey": "e112c1ba8cb24f99ac563837dbf1083e",
      },
    ).then((value) {
      emit(GeneralSuccessState());
      general = value.data['articles'];
    }).catchError((error) {
      emit(GeneralErrorState(error.toString()));
      print(error.toString());
    });
  }

////////************************************************/////////
  void getTechnology() {
    emit(TechnologyloadingState());
    DioHelper.getData(
      url: "/v2/top-headlines",
      query: {
        "country": "eg",
        "category": "technology",
        "apiKey": "e112c1ba8cb24f99ac563837dbf1083e",
      },
    ).then((value) {
      emit(TechnologySuccessState());
      technology = value.data['articles'];
    }).catchError((error) {
      emit(TechnologyErrorState(error.toString()));
      print(error.toString());
    });
  }

////////************************************************/////////

  void getScience() {
    emit(ScienceloadingState());
    DioHelper.getData(
      url: "/v2/top-headlines",
      query: {
        "country": "eg",
        "category": "science",
        "apiKey": "e112c1ba8cb24f99ac563837dbf1083e",
      },
    ).then((value) {
      emit(ScienceSuccessState());
      science = value.data['articles'];
    }).catchError((error) {
      emit(ScienceErrorState(error.toString()));
      print(error.toString());
    });
  }

////////************************************************/////////
  void getEntertainment() {
    emit(EntertainmentloadingState());
    DioHelper.getData(
      url: "/v2/top-headlines",
      query: {
        "country": "eg",
        "category": "entertainment",
        "apiKey": "e112c1ba8cb24f99ac563837dbf1083e",
      },
    ).then((value) {
      emit(EntertainmentSuccessState());
      entertainment = value.data['articles'];
    }).catchError((error) {
      emit(EntertainmentErrorState(error.toString()));
      print(error.toString());
    });
  }

////////************************************************/////////

}
