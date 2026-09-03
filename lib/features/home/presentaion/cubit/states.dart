import 'package:doctors_app/features/home/data/models/doctor_model.dart';

sealed class HomeStates{}

class HomeInitial extends HomeStates{}

class HomeLoading extends HomeStates{}

class HomeSuccess extends HomeStates{
  final List<DoctorModel> doctorList;

  HomeSuccess({required this.doctorList});
}

class HomeFailer extends HomeStates{
  final String error;

  HomeFailer({required this.error});

}