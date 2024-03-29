import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medg_exam/assets/colors.dart';

import '../../../../core/routs_name/app_rout_name.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isObscure = false;
  bool isLoginDataValid = true;
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();


  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });

    passwordTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 50,
              )
            ],
          ),
        ),
        bottomOpacity: 1,
        elevation: 1,
        toolbarHeight: 100,
        backgroundColor: AppColors.white,
        shadowColor:
        const Color(0xFF000000).withAlpha(0).withBlue(16).withOpacity(0.16),
      ),
      body:  BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return Builder(
                builder: (context) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(25),
                        Center(child: Text("Ro'yxatdan o'tish",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.loginTitle,fontFamily: "Barwol"),)),
                        Gap(35),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: "Barwol",color: AppColors.textFieldHelper),),
                            SizedBox(height: 8),
                            TextField(

                              controller: emailTextEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter email',
                              ),
                            ),
                            Gap(20),
                            Text("Maxfiy kalit",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: "Barwol",color: AppColors.textFieldHelper),),
                            Gap(8),
                            TextField(
                              controller: passwordTextEditingController,
                            ),
                            Gap(54),
                            Center(child: TextButton(onPressed: ()async {
                              context.read<AuthenticationBloc>().add(
                                AuthenticationSingUpRequested(
                                  email:
                                  emailTextEditingController.text.trim(),
                                  password: passwordTextEditingController.text
                                      .trim(),
                                  onSuccess: () {
                                    Navigator.pushNamed(
                                        context, AppRouteNames.main);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text("Muofaqiyatli ro'yxatdan o'tdingiz tabriklaymiz!!!"),
                                      ),
                                    );
                                  },
                                  onFailure: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(""),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }, child: Text("Kirish"))),

                          ],
                        ),),
                      ],
                    ),);
                }
            );
          },
        ),
      ),
    );
  }
}
