import 'package:clean_architect/features/data/models/response/task.dart';
import 'package:clean_architect/features/presentation/components/utility/color_resource.dart';
import 'package:clean_architect/features/presentation/components/utility/images.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/item_daily_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getBackgroundColor(),
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
                  const SizedBox(width: 14,),
                  Text('👋 Xin chào, \nGiám đốc bệnh viện',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.blue.shade800),),
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
    );
  }
}

