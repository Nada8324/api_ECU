import 'package:doctors_app/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorItem extends StatelessWidget {
  final DoctorModel model;
  const DoctorItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.grey.shade100,
      ),
      padding: EdgeInsets.all(20.r),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Image.network(
            model.photo,
            width: 100.w,
            height: 100.h,
            fit: .cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/doctor.jpg",
                width: 100.w,
                height: 100.h,
                fit: .cover,
              );
            },
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: .start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(fontWeight: .bold, fontSize: 25),
                ),
                Text(model.specialization),
                Row(
                  children: [Icon(Icons.attach_money), Text("${model.price}")],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Expanded(child: Text(model.address, maxLines: 2)),
                  ],
                ),
                Row(children: [Icon(Icons.access_time), Text(model.startTime)]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
