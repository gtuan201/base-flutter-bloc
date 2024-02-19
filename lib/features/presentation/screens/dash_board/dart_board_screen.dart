import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:clean_architect/features/presentation/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/utility/color_resource.dart';
import '../home/home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  int selectedIndex = 0;
  var listIcon = [FontAwesomeIcons.houseChimneyWindow,FontAwesomeIcons.userDoctor,FontAwesomeIcons.solidBell,FontAwesomeIcons.gear];
  var listLabel = ['Trang chủ','Cá nhân','Thông báo','Cài đặt'];
  List<Widget> listScreen = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.getBackgroundColor(),
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.getBackgroundColor(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade700,
          onPressed: () {

          },
          child: const FaIcon(FontAwesomeIcons.stethoscope),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          activeIndex: selectedIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          elevation: 12,
          height: 62,
          onTap: (index) => setState(() => selectedIndex = index),
          itemCount: 4,
          leftCornerRadius: 16,
          rightCornerRadius: 16,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(listIcon[index],color: isActive ? Colors.blue.shade700 : Colors.grey.shade600,),
                const SizedBox(height: 4,),
                Text(listLabel[index],style: TextStyle(color: isActive ? Colors.blue.shade700 : Colors.grey.shade600),)
              ],
            );
          },
        ),
        body: listScreen[selectedIndex],
      )
    );
  }
}
