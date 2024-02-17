import 'package:bloc/bloc.dart';
import 'package:clean_architect/features/data/repositories/auth_repo.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:clean_architect/features/presentation/components/utility/snackbar.dart';
import 'package:clean_architect/features/presentation/screens/home/home_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';

class SignInBloc extends Bloc<SignInEvent,LoginState>{
  final AuthRepo repo = GetIt.instance.get<AuthRepo>();
  SignInBloc() : super(const LoginState()) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isShowPassword: event.isShowPassword));
    });
    on<PressLogin>((event, emit) async {
      if(event.username.isNotEmpty && event.password.isNotEmpty){
        await login(event, emit);
      }
      else {
        emit(state.copyWith(username: event.username,password: event.password));
      }
    });
    on<OnEmailChange>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
    on<OnPasswordChange>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
  Future<void> login(PressLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    Response response = await repo.login(username: event.username, password: event.password);
    emit(state.copyWith(isLoading: false));
    if(response.statusCode == 200){
      await repo.saveTokenUser(response.body['access_token']);
      Get.off(() => const HomeScreen());
    }
    else{
      showCustomSnackBar('Tài khoản hoặc mật khẩu không đúng');
    }
  }
}