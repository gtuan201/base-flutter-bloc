import 'package:clean_architect/features/presentation/blocs/setting_bloc/setting_bloc.dart';
import 'package:clean_architect/features/presentation/blocs/setting_bloc/setting_event.dart';
import 'package:clean_architect/features/presentation/blocs/setting_bloc/setting_state.dart';
import 'package:clean_architect/features/presentation/components/utility/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.getBackgroundColor(),
        body: BlocBuilder<SettingBloc,SettingState>(builder: (context,state){
          return Center(
            child: ElevatedButton(
                onPressed: (){
                  context.read<SettingBloc>().add(LogOutEvent());
                },
                child: const Text('Đăng xuất')
            ),
          );
        })
      )
    );
  }
}
