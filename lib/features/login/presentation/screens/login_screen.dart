import 'package:doctors_app/core/widgets/text_form_field.dart';
import 'package:doctors_app/features/home/presentaion/cubit/cubit.dart';
import 'package:doctors_app/features/home/presentaion/screens/home_screen.dart';
import 'package:doctors_app/features/login/data/models/request_model.dart';
import 'package:doctors_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:doctors_app/features/login/presentation/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 30.sp, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  spacing: 15.h,
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'nada@gmail.com',
                      labelText: 'Email',
                      keyboardType: .emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your Email";
                        }
                        final RegExp emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return "enter valid email";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'enter your password',
                      labelText: 'Password',
                      keyboardType: .visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password";
                        }
                        if (value.length < 6) {
                          return "password should be more than 6 char";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              BlocConsumer<LoginCubit, LoginStates>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Loggedin Successful"),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => HomeCubit()..getDoctors(),
                          child: HomeScreen(),
                        ),
                      ),
                    );
                  }
                  if(state is LoginFailer){
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final user = RequestModel(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        context.read<LoginCubit>().onPressed(user);
                      }
                    },
                    child: state is LoginLoading
                        ? CircularProgressIndicator()
                        : Text("Login"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
