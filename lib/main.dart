import 'package:doctors_app/core/local_storage/shared_pref.dart';
import 'package:doctors_app/features/home/presentaion/cubit/cubit.dart';
import 'package:doctors_app/features/home/presentaion/screens/home_screen.dart';
import 'package:doctors_app/features/register/presentaion/cubit/register_cubit.dart';
import 'package:doctors_app/features/register/presentaion/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await SharedPref.getToken();
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedIn
            ? BlocProvider(
                create: (context) => HomeCubit()..getDoctors(),
                child: HomeScreen(),
              )
            : BlocProvider(
                create: (context) => RegisterCubit(),
                child: RegisterScreen(),
              ),
      ),
    );
  }
}
