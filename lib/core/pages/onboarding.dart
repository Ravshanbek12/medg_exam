import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medg_exam/assets/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../injector/injector.dart';
import '../routs_name/app_rout_name.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  int thisPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  DecorationImage _buildDecorationImage() {
    if (thisPage == 0) {
      return const DecorationImage(
        image: AssetImage("assets/images/onb1.png"),
        fit: BoxFit.cover,
      );
    } else if (thisPage == 1) {
      return const DecorationImage(
        image: AssetImage("assets/images/onb2.png"),
        fit: BoxFit.cover,
      );
    } else {
      return const DecorationImage(
        image: AssetImage("assets/images/onb3.png"),
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: _buildDecorationImage(),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    thisPage = value;
                  },
                  controller: controller,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                sl<SharedPreferences>().setBool("wizard", true);
                                Navigator.of(context)
                                    .pushReplacementNamed(AppRouteNames.sigUp);
                              },
                              child: Text(
                                "Skip",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            const Gap(8),
                          ],
                        ),
                        Gap(MediaQuery.sizeOf(context).height * 0.6),
                        const Text("Mutaxasislardan maslahat",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onBoardingTitle1)),
                        const Gap(19),
                        const Text(
                            textAlign: TextAlign.center,
                            "Find a doctor who will take the best \ncare of your health...",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.onBoardingSubtitle)),
                        Gap(MediaQuery.of(context).padding.bottom + 55),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Gap(MediaQuery.sizeOf(context).height * 0.6),
                        const Text(
                          textAlign: TextAlign.center,
                          "Rejalashtirilgan \ndavolanish tartibi",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onBoardingSubtitle),
                        ),
                        const Gap(10),
                        const Text(
                            textAlign: TextAlign.center,
                            "Set up a reminder to take the \nmedicine on time...",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.onBoardingSubtitle)),
                        Gap(MediaQuery.of(context).padding.bottom + 60),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Gap(MediaQuery.sizeOf(context).height * 0.6),
                        const Text("Order Medicine Online",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onBoardingTitle3)),
                        const Gap(19),
                        const Text(
                            textAlign: TextAlign.center,
                            "Order your medicine that your \ndoctor provided you...",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.onBoardingSubtitle)),
                        Gap(MediaQuery.of(context).padding.bottom + 60),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.mainButton,
                  borderRadius: BorderRadius.circular(4)
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.mainButton),
                      elevation: MaterialStateProperty.all(0)
                    ),
                    onPressed: () async {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      if (thisPage == 3) {
                        sl<SharedPreferences>().setBool("wizard", true);
                        print(
                            "isLogin: ${sl<SharedPreferences>().getBool("wizard")}");
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRouteNames.main, (route) => false);
                      } else {
                        thisPage += 1;
                      }
                      setState(() {});
                    },
                    child:
                        Text(thisPage == 2 ? "Asosiyga o'tish" : "Davom etish")),
              ),
            ],
          ),
        ),
        //___________________________________________________________________________________________________//
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16,
          ),
          // child: MyButton(
          //   onTap: () async {
          //     if (thisPage == 0 || thisPage == 1) {
          //       controller.nextPage(
          //           duration: const Duration(milliseconds: 300),
          //           curve: Curves.ease);
          //     } else {
          //       sl<SharedPreferences>().setBool("wizard", true);
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          //     }
          //   },
          //   title: thisPage == 2 ? "Asosiyga o’tish" : "Davom etish",
          //   buttonColor: bottomColor,
          // ),
        ),
      ),
    );
  }
}
