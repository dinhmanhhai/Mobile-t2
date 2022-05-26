import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mobile/app/component/circular/circular.dart';
import 'package:mobile/app/component/form_builder/text.dart';
import 'package:mobile/app/data/theme/theme.dart';
import 'package:sizer/sizer.dart';

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
        top: true,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  TextFieldValidate(
                    name: "title",
                    // fillColor: Colors.red,
                    fillColor: CustomColors.backGroundColor,
                    filled: true,
                    textStyle: titleTextStyle.copyWith(color: CustomColors.regularText, fontSize: SizeText.size24),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    prefixIconConstraints: BoxConstraints(),
                    validator: [],
                  ),
                  Container(
                    height: 40.h,
                    child: TextFieldValidate(
                      name: "title",
                      // fillColor: Colors.blue,
                      fillColor: CustomColors.backGroundColor,
                      filled: true,
                      textStyle: titleTextStyle.copyWith(color: CustomColors.regularText, fontSize: SizeText.size16),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      prefixIconConstraints: const BoxConstraints(),
                      validator: [],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              color: CustomColors.backGroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_back_ios),
                        Text(
                          'Tất cả ghi chú',
                          style: titleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
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
                      Text(
                        'Xong',
                        style: titleTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            BlocBuilder<DetailsCubit, DetailsState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state is Uploading) {
                  return Align(
                    alignment: Alignment.center,
                    child: circularCustom(color: CustomColors.darkBlueText),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
