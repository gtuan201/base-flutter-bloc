import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:clean_architect/features/presentation/components/utility/color_resource.dart';
import 'package:clean_architect/features/presentation/components/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  static const String route = '/LoginScreen';
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.getBackgroundColor(),
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: ColorResources.getBackgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: Get.height*0.05,),
                Center(child: Image.asset(Images.bigLogo,width: 200,height: 200,)),
                Text('Đăng nhập',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.grey.shade700),),
                SizedBox(height: Get.height*0.016,),
                BlocBuilder<SignInBloc,LoginState>(
                  buildWhen: (previous,current){
                    return previous.username != current.username;
                  },
                  builder: (context,state){
                    return TextField(
                      controller: _usernameCtrl,
                      keyboardType: TextInputType.text,
                      onChanged: (username){
                        context.read<SignInBloc>().add(OnEmailChange(username));
                      },
                      style: const TextStyle(fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        errorText: state.username.isEmpty ? "Không được bỏ trống" : null,
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Email/Username đã đăng ký',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    );
                  }),
                SizedBox(height: Get.height*0.016,),
                BlocBuilder<SignInBloc,LoginState>(
                  buildWhen: (previous,current){
                    return previous.password != current.password || previous.isShowPassword != current.isShowPassword;
                  },
                  builder: (context,state){
                    return TextField(
                      controller: _passwordCtrl,
                      onChanged: (password){
                        context.read<SignInBloc>().add(OnPasswordChange(password));
                      },
                      style: const TextStyle(fontWeight: FontWeight.w400),
                      obscureText: !state.isShowPassword,
                      decoration: InputDecoration(
                          errorText: state.password.isEmpty ? "Không được bỏ trống" : null,
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Mật khẩu',
                          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                          suffixIcon: InkWell(
                            onTap: (){
                              context.read<SignInBloc>().add(TogglePasswordVisibility(isShowPassword: !state.isShowPassword));
                            },
                            child: state.isShowPassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                          )
                      ),
                    );
                  },
                ),
                SizedBox(height: Get.height*0.06,),
                BlocBuilder<SignInBloc,LoginState>(
                  buildWhen: (previous,current){
                    return previous.isLoading != current.isLoading;
                  },
                  builder: (context,state) {
                    return ElevatedButton(
                        onPressed: () {
                          if(!state.isLoading){
                            FocusScope.of(context).unfocus();
                            context.read<SignInBloc>().add(PressLogin(_usernameCtrl.text, _passwordCtrl.text));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(Get.width - 32, 54)
                        ),
                        child: state.isLoading ? const SizedBox(
                          height: 32,
                            width: 26,
                            child: CircularProgressIndicator(color: Colors.white,)) : const Text("Đăng nhập",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,letterSpacing: 2),)
                    );
                  }),
                SizedBox(height: Get.height*0.03,),
                InkWell(
                    onTap: (){},
                    child: const Center(
                      child: Text("Quên mật khẩu",style: TextStyle(
                          color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w600
                      ),),
                    )
                ),
                SizedBox(height: Get.height*0.03,),
                InkWell(
                    onTap: (){},
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'Bạn chưa có mật khẩu? ',style: TextStyle(color: Colors.grey.shade600)),
                            const TextSpan(text: 'Đăng ký ngay',style: TextStyle(
                                color: Colors.blue,fontWeight: FontWeight.w500
                            ),)
                          ]
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
