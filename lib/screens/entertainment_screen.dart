import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit/news_cubit.dart';
import 'package:news_app/bloc/cubit/news_state.dart';

import '../helper/components.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getEntertainment(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var listEntertainment = NewsCubit.get(context).entertainment;

          var scaffoldKey = GlobalKey<ScaffoldState>();
          return Scaffold(
            key: scaffoldKey,
            floatingActionButton: floatingButton(scaffoldKey),
            body: SafeArea(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                controller: PageController(),
                itemBuilder: (context, index) =>
                    buildBodyItem(listEntertainment[index], context),
                itemCount: listEntertainment.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
