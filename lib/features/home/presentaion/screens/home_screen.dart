import 'package:doctors_app/features/home/presentaion/cubit/cubit.dart';
import 'package:doctors_app/features/home/presentaion/cubit/states.dart';
import 'package:doctors_app/features/home/presentaion/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Doctors',
          style: TextStyle(
            fontSize: 40.sp,
            color: Colors.black,
            fontWeight: .bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return CircularProgressIndicator();
            }
            if (state is HomeSuccess) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: state.doctorList.length,
                itemBuilder: (context, index) {
                  final item = state.doctorList[index];
                  return DoctorItem(model: item);
                },
              );
            }
            if (state is HomeFailer) {
              return Text(state.error, style: TextStyle(fontSize: 30));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
