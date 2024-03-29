import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medg_exam/features/calendar/calendar_screen.dart';
import 'package:medg_exam/features/home/presentation/pages/articles.dart';
import 'package:medg_exam/features/home/presentation/pages/calendar.dart';
import 'package:medg_exam/features/home/presentation/pages/chat.dart';
import 'package:medg_exam/features/home/presentation/pages/main_page.dart';
import 'package:medg_exam/features/home/presentation/pages/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../assets/colors.dart';

class BasicController extends StatefulWidget {
  const BasicController({super.key});

  @override
  State<BasicController> createState() => _BasicControllerState();
}

class _BasicControllerState extends State<BasicController> {
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
       BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/icons/home.svg",color: bottomSelectedIndex==0?AppColors.loginTitle:AppColors.textFieldHelper,),

        label: "Asosiy",
      ),
       BottomNavigationBarItem(
        icon:SvgPicture.asset("assets/icons/article.svg",color: bottomSelectedIndex==1?AppColors.loginTitle:AppColors.textFieldHelper,),
        label: "Maqolalar",
      ),
       BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/icons/chat.svg",color: bottomSelectedIndex==2?AppColors.loginTitle:AppColors.textFieldHelper,),
        label: "Chat",
      ),
       BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/icons/calendar.svg",color: bottomSelectedIndex==3?AppColors.loginTitle:AppColors.textFieldHelper,),
        label: "Kalendar",
      ),
       BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/icons/profile.svg",color: bottomSelectedIndex==4?AppColors.loginTitle:AppColors.textFieldHelper,),
        label: "Profile",
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const <Widget>[
        MainPage(),
        ArticlePage(),
        ChatPage(),
        CalendarScreen(),
        ProfilePage()
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 1,
        elevation: 1,
        backgroundColor: AppColors.white,
        shadowColor:
            const Color(0xFF000000).withAlpha(0).withBlue(16).withOpacity(0.16),
        toolbarHeight: 100,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 50,
                ),
                SvgPicture.asset("assets/icons/notification.svg")
              ],
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
            child: CupertinoTextField(
              placeholder: "Ilmiy maqolalarni izlash",
              autofocus: true,
              prefix: Icon(Icons.search),
              cursorHeight: 23,
              autocorrect: false,
              decoration: BoxDecoration(
                color: Color(0xFFECEDF0),
              ),
            ),
          ),
        ),
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.loginTitle,
        unselectedItemColor: AppColors.textFieldHelper,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
          setState(() {

          });
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}
