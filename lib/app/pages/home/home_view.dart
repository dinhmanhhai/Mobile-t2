import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/data/theme/theme.dart';
import 'package:sizer/sizer.dart';

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
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFE57373),
          onPressed: () => _cubit.navigator(0)),
      body: SafeArea(
        top: Platform.isIOS,
        child: Stack(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state is ListTileView) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(
                        top: ScreenSize.height * .15,
                        left: ScreenSize.height * .02,
                        right: ScreenSize.height * .02,
                        bottom: ScreenSize.height * .04),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            20,
                            (index) => cardComponent(index),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (state is GridTileView) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 1,
                      padding: EdgeInsets.only(top: ScreenSize.height * 0.15),
                      children: [
                        ...List.generate(
                          20,
                          (index) => cardComponent(index),
                        ),
                      ]);
                }
                return const SizedBox();
              },
            ),
            Container(
              padding: EdgeInsets.all(ScreenSize.height * .02),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => _showDialog(),
                      child: Container(
                        margin: EdgeInsets.only(right: 4.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColors.yellowText,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.more_horiz_sharp, color: CustomColors.yellowText, size: 18),
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: Image.asset(
                            'assets/avatar.jpeg',
                            height: 10.h,
                          ),
                        ),
                        Text(
                          '  Day la ten tai khoan',
                          style: titleTextStyle.copyWith(
                              fontSize: 24, fontWeight: FontWeight.w500, color: CustomColors.firebaseYellow),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardComponent(int index) {
    return Card(
      color: CustomColors.cardColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () => _cubit.navigator(index),
        contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.width * .02),
        title: Text(
          "title",
          style: titleTextStyle,
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: ScreenSize.width * .01),
          child: Text(
            "titlafgsdkhgkjhgflkhdsflkghjlskdfghjlkdjfglkjdslhgjdslkfgjkldsfjgldsjfglkjdsflkgjlksdje",
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: subTitleTextStle,
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Material(
        child: Container(
          height: 50.h,
          width: 100.w,
          padding: EdgeInsets.only(top: 2.h),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => _cubit.changeView(),
                      child: Icon(
                        Icons.folder,
                        color: CustomColors.yellowText,
                        size: 10.h,
                      ),
                    ),
                    Text('Tất cả ghi chú', style: titleTextStyle.copyWith(color: CustomColors.regularText,),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
