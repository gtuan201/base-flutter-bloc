import 'package:bloc/bloc.dart';
import 'package:clean_architect/features/presentation/blocs/setting_bloc/setting_event.dart';
import 'package:clean_architect/features/presentation/blocs/setting_bloc/setting_state.dart';
import 'package:clean_architect/features/presentation/components/widget/dialog.dart';
import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import '../../../data/repositories/auth_repo.dart';

class SettingBloc extends Bloc<SettingEvent,SettingState>{
  final AuthRepo repo = GetIt.instance.get<AuthRepo>();
  SettingBloc() : super(SettingState()){
    on<LogOutEvent>((event, emit) {
      showCustomDialog(title: 'Đăng xuất',content: 'Bạn có chắc muốn đăng xuất?',onPressConfirm: () async {
        await repo.clearUserToken();
        Get.offAll(() => LoginScreen());
      });
    });
  }
}