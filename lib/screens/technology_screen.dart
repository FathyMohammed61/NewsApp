import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit/news_cubit.dart';
import 'package:news_app/bloc/cubit/news_state.dart';

import '../helper/components.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getTechnology(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var listTech = NewsCubit.get(context).technology;
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
                    buildBodyItem(listTech[index], context),
                itemCount: listTech.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
