import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit/news_cubit.dart';
import 'package:news_app/bloc/cubit/news_state.dart';

import '../helper/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getSports(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var listEntertainment = NewsCubit.get(context).sports;
          var scaffoldKey = GlobalKey<ScaffoldState>();
          return Scaffold(
            key: scaffoldKey,
            floatingActionButton: floatingButton(scaffoldKey),
            body: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: PageController(),
              itemBuilder: (context, index) =>
                  buildBodyItem(listEntertainment[index], context),
              itemCount: listEntertainment.length,
            ),
          );
        },
      ),
    );
  }
}
