import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/news_cubit.dart';
import '../bloc/cubit/news_state.dart';
import '../helper/components.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

/*

  List business = [];
  List entertainment = [];
  List general = [];
  List health = [];
  List science = [];
  List sports = [];
  List technology = [];
 */
class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var listBusiness = NewsCubit.get(context).business;
          var scaffoldKey = GlobalKey<ScaffoldState>();
          return Scaffold(
            key: scaffoldKey,
            floatingActionButton: floatingButton(scaffoldKey),
            body: SafeArea(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: PageController(),
                itemBuilder: (context, index) =>
                    buildBodyItem(listBusiness[index], context),
                itemCount: listBusiness.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
