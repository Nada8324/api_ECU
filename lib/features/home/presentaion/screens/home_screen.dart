import 'package:doctors_app/features/home/data/models/doctor_model.dart';
import 'package:doctors_app/features/home/presentaion/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
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
        child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount:4,
                itemBuilder: (context, index) {
                 

                  return DoctorItem(model: DoctorModel(name: "name", photo: "photo", address: "address", specialization: "specialization", appointPrice: 100, startTime: "startTime"),);
                },
              )
       
      ),
    );
  }
}
