import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medg_exam/assets/colors.dart';

import '../bloc/article_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final categoryIcon = [
    'assets/icons/psix.svg',
    'assets/icons/cardi.svg',
    'assets/icons/nevro.svg'
  ];
  final categoryName = ['Psixologiya', 'Kardiologiya', 'Nevrologiya'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: BlocBuilder<ArticleBloc, ArticleInitial>(
              builder: (context, state) {
                if (state.status == ArticleStatus.success) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Turkumlar",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Barlow",
                                color: AppColors.loginTitle),
                          ),
                        ),
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            itemCount: categoryIcon.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                height: 20,
                                width: 180,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xFF000000).withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(4)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(16),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child:
                                          SvgPicture.asset(categoryIcon[index]),
                                    ),
                                    const Gap(15),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        categoryName[index],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Barwol",
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.loginTitle),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        ...List.generate(

                          state.data.length,
                          (index) => Container(
                            margin: const EdgeInsets.all(10),
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.onBoardingTitle1,
                                    width: 1)),
                            child: Column(),
                            // child: Text('Grid Item $indexg'),
                          ),

                        )
                      ],
                    ),
                  );
                }
                else if (state.status == ArticleStatus.pure) {
                  context.read<ArticleBloc>().add(GetArticles());
                  return SizedBox(
                    child: Text("Status----PURE"),
                  );
                } else if (state.status == ArticleStatus.loading) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return const Center(
                  child: Text("Failure"),
                );
              },
            ));
      }),
    );
  }
}
