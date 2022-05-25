import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit/news_cubit.dart';
import 'package:news_app/bloc/cubit/news_state.dart';

import '../helper/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getScience(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var listScience = NewsCubit.get(context).science;
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
                    buildBodyItem(listScience[index], context),
                itemCount: listScience.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
