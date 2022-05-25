import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/data/theme/theme.dart';

import 'details_cubit.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late DetailsCubit _cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit = DetailsCubit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backGroundColor,
      body: SafeArea(
        top: false,
        child: Center(
          child: Text("dsfsdfsdfsd"),
        ),
      ),
    );
  }
}
