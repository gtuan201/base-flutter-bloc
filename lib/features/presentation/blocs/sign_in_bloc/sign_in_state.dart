import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  final String username;
  final String password;
  final bool isShowPassword;
  final bool isLoading;

  const LoginState({
    this.username = '.',
    this.password = '.',
    this.isShowPassword = false,
    this.isLoading = false,
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isShowPassword,
    bool? isLoading,
  }){
    return LoginState(
      username: username ?? this.username,
      password:  password ?? this.password,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isLoading: isLoading ?? this.isLoading
    );
  }

  @override
  List<Object?> get props => [username,password,isShowPassword,isLoading];
}
