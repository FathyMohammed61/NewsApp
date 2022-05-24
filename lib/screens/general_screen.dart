import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit/news_cubit.dart';
import 'package:news_app/bloc/cubit/news_state.dart';

import '../helper/components.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getGeneral(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var listGeneral = NewsCubit.get(context).general;
          var scaffoldKey = GlobalKey<ScaffoldState>();
          return Scaffold(
            key: scaffoldKey,
            floatingActionButton: floatingButton(scaffoldKey),
            body: SafeArea(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: PageController(),
                itemBuilder: (context, index) =>
                    buildBodyItem(listGeneral[index], context),
                itemCount: listGeneral.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
