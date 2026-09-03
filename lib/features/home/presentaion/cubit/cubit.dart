import 'package:doctors_app/features/home/data/data_source/home_data_source.dart';
import 'package:doctors_app/features/home/presentaion/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  void getDoctors() async {
    emit(HomeLoading());
    try {
      final doctosList = await HomeDataSource.getData();
      print(doctosList);
      emit(HomeSuccess(doctorList: doctosList));
    } catch (e) {
      emit(HomeFailer(error: e.toString()));
    }
  }
}
