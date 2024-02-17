import 'package:clean_architect/features/data/models/response/task.dart';
import 'package:clean_architect/features/presentation/components/utility/color_resource.dart';
import 'package:clean_architect/features/presentation/components/utility/images.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/item_daily_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  var listIcon = [FontAwesomeIcons.houseChimneyWindow,FontAwesomeIcons.userDoctor,FontAwesomeIcons.solidBell,FontAwesomeIcons.gear];
  var listLabel = ['Trang chủ','Cá nhân','Thông báo','Cài đặt'];

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
          //other params
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(Images.doctor,height: 46,width: 46,),
                    ),
                    SizedBox(width: Get.width*0.03,),
                    Text('Xin chào, \nGiám đốc bệnh viện',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.blue.shade800),),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.bars,size: 20,))
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width*0.43,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Color(0xFF7757CB)], // Add your desired colors here
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 28,horizontal: 16),
                      child: Column(
                        children: [
                          const Text('Quản lý bệnh nhân',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),),
                          SizedBox(height: Get.height*0.02,),
                          Image.asset(Images.patient,width: 88,),
                          SizedBox(height: Get.height*0.02,),
                          Text('Hồ sơ bệnh nhân, thông tin bệnh án,...',style: TextStyle(fontSize: 12,color: Colors.grey.shade100,fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width*0.43,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF53BED7), Color(
                              0xFF378BC2)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 28,horizontal: 16),
                      child: Column(
                        children: [
                          const Text('Quản lý nhân viên',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),),
                          SizedBox(height: Get.height*0.02,),
                          Image.asset(Images.staff,width: 88,),
                          SizedBox(height: Get.height*0.02,),
                          Text('Hồ sơ nhân viên, thời gian làm việc,...',style: TextStyle(fontSize: 12,color: Colors.grey.shade100,fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                const Text('Danh sách công việc trong ngày',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                const SizedBox(height: 16,),
                ListView.separated(
                    controller: ScrollController(),
                    itemBuilder: (context, index) => ItemDailyTask(task: dailyTasks[index],),
                    shrinkWrap: true,
                    separatorBuilder: (context,index) => const SizedBox(height: 10,),
                    itemCount: dailyTasks.length
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

