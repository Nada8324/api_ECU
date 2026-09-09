import 'package:doctors_app/features/register/data/data_source/register_data_source.dart';
import 'package:doctors_app/features/register/data/models/register_model.dart';
import 'package:doctors_app/features/register/presentaion/cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> pressed(RegisterModel model) async {
    emit(RegisterLoading());
    try {
      await RegisterDataSource.signUp(model);
      emit(RegisterSuccess());
    } on Exception catch (e) {
      emit(RegisterFailer(error: e.toString()));
    }
  }
}
