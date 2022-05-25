import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/component/button/CustomButton.dart';
import 'package:mobile/app/data/theme/theme.dart';

import 'home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit _cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit = HomeCubit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/avatar.jpeg',
                      height: ScreenSize.height * .1,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Note app for PTIT',
                      style: TextStyle(
                        color: CustomColors.firebaseYellow,
                        fontSize: SizeText.size16,
                      ),
                    ),
                    Text(
                      'Design by DMH',
                      style: TextStyle(
                        color: CustomColors.firebaseOrange,
                        fontSize: SizeText.size16,
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                width: ScreenSize.width * .60,
                onPressed: () {},
                elevation: 8,
                shadowColor: CustomColors.firebaseYellow,
                height: ScreenSize.height * .05,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
