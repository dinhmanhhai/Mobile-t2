import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/app/component/button/button.dart';
import 'package:mobile/app/component/circular/circular.dart';
import 'package:mobile/app/component/form_builder/text.dart';
import 'package:mobile/app/data/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> {
  late LoginCubit _cubit;
  Map<String, dynamic>? params;
  bool review = false;

  // late  node;
  List<FocusNode> listFocusNode = List.generate(2, (index) => FocusNode());
  List<FocusNode> listIndex = List.generate(10, (index) => FocusNode());
  String val1 = '';
  String val2 = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit = LoginCubit(context);
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: DecoratedBox(
          decoration: BoxDecoration(gradient: GradientColors.appColorGradient),
          child: Stack(
            children: [
              Container(
                height: 25.h,
                padding: EdgeInsets.only(bottom: 3.h),
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset("assets/logo.svg", width: 60.w),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h),
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                height: 70.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: CustomColor.backGroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 70.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h),
                        Text(
                          "Login",
                          style: titleTextStyle,
                        ),
                        SizedBox(height: 2.h),
                        Text.rich(TextSpan(
                            text: "Phone number",
                            style: titleTextStyle.copyWith(color: CustomColor.regularText),
                            children: const [
                              TextSpan(
                                text: " *",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            ])),
                        SizedBox(height: 1.h),
                        TextFieldValidate(
                          name: "phone",
                          prefixIconConstraints: const BoxConstraints(),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            LengthLimitingTextInputFormatter(11)
                          ],
                          // textInputAction: TextInputAction.next,
                          // onEditingComplete: () => listFocusNode[0].nextFocus(),
                          prefixIcon: Container(
                              child: SvgPicture.asset("assets/login/phone.svg", height: 3.h, width: 3.h),
                              margin: const EdgeInsets.symmetric(horizontal: 10)),
                          hintText: "Enter your phone number", validator: [],
                        ),
                        SizedBox(height: 2.h),
                        Text.rich(TextSpan(
                            text: "Password",
                            style: titleTextStyle.copyWith(color: CustomColor.regularText),
                            children: const [
                              TextSpan(
                                text: " *",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            ])),
                        SizedBox(height: 1.h),
                        BlocBuilder<LoginCubit, LoginState>(
                          bloc: _cubit,
                          builder: (context, state) => TextFieldValidate(
                            name: "password",
                            prefixIconConstraints: const BoxConstraints(),
                            obscureText: !review,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9()_!@#\$%^&*?]")),
                              LengthLimitingTextInputFormatter(20)
                            ],
                            onEditingComplete: () async {
                              if (state is! Loging)
                                _cubit.handleOnTap();
                            },
                            // onEditingComplete:,
                            suffixIcon: IconButton(
                              icon: review
                                  ? SvgPicture.asset("assets/login/visibility_off.svg",
                                      width: 5.w, color: CustomColor.greyText)
                                  : SvgPicture.asset("assets/login/visibility.svg",
                                      width: 5.w, color: CustomColor.greyText),
                              onPressed: () {
                                setState(() {
                                  review = !review;
                                });
                              },
                            ),
                            prefixIcon: Container(
                                child: SvgPicture.asset("assets/login/password.svg", height: 3.h, width: 3.h),
                                margin: const EdgeInsets.symmetric(horizontal: 10)),
                            hintText: "Enter password", validator: [],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        BlocBuilder<LoginCubit, LoginState>(
                          bloc: _cubit,
                          buildWhen: (prev, now) => now is ButtonPressable || now is LoginInitial || now is Loging,
                          builder: (context, state) => Button(
                            child: state is Loging ? circularCustom() : null,
                            text: "Login",
                            onTap: () => {
                              _cubit.handleOnTap()
                              // if (key.currentState!.saveAndValidate()) {Modular.to.navigate(AppModule.home)}
                            },
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          // height: 15.h,
                          // padding: EdgeInsets.only(top: 2.h),
                          margin: EdgeInsets.only(bottom: 5.h),
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: InkWell(
                                  // onTap: () => Modular.to.pushNamed(AppModule.forgot),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 4.h,
                                    child: Text(
                                      "Forgot password?",
                                      style: titleTextStyle.copyWith(color: CustomColor.regularText),
                                    ),
                                  ),
                                ),
                              ),
                              // const Expanded(child: SizedBox(), flex: 2),
                              Center(
                                child: FittedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: SizeText.size14,
                                                color: CustomColor.regularText,
                                              ),
                                              children: [
                                                TextSpan(text: "You don't have an account?"),
                                                const TextSpan(text: " "),
                                              ]),
                                        ),
                                        InkWell(
                                          // onTap: () => Modular.to.pushNamed(AppModule.register),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 5.h,
                                            child: Text(
                                              "Sign up",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.w500,
                                                fontSize: SizeText.size14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
