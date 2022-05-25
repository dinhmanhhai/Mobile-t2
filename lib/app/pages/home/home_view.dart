import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      backgroundColor: CustomColors.backGroundColor,
      body: SafeArea(
        top: false,
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
                            (index) => Card(
                              color: listColors[index],
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
                                subtitle: Container(
                                  margin: EdgeInsets.only(right: ScreenSize.width * 0.4),
                                  child: Text(
                                    "titlafgsdkhgkjhgflkhdsflkghjlskdfghjlkdjfglkjdslhgjdslkfgjkldsfjgldsjfglkjdsflkgjlksdje",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: subTitleTextStle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (state is GridTileView) {
                  return GridView.count(crossAxisCount: 2, childAspectRatio: 2 / 1, padding: EdgeInsets.only(top: ScreenSize.height * 0.15), children: [
                    ...List.generate(
                      20,
                      (index) => Card(
                        color: listColors[index],
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
                          subtitle: Container(
                            margin: EdgeInsets.only(right: ScreenSize.width * 0.1),
                            child: Text(
                              "titlafgsdkhgkjhgflkhdsflkghjlskdfghjlkdjfglkjdslhgjdslkfgjkldsfjgldsjfglkjdsflkgjlksdje",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: subTitleTextStle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                }
                return const SizedBox();
              },
            ),
            InkWell(
              onTap: () => _cubit.changeView(),
              child: Container(
                padding: EdgeInsets.all(ScreenSize.height * .02),
                decoration: const BoxDecoration(
                  color: CustomColors.backGroundColor,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        'assets/avatar.jpeg',
                        height: ScreenSize.height * .1,
                      ),
                    ),
                    Text(
                      '  Day la ten tai khoan',
                      style: googleFontTitle.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
