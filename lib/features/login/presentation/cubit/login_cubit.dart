import 'package:doctors_app/core/local_storage/shared_pref.dart';
import 'package:doctors_app/features/login/data/data_source/login_data_source.dart';
import 'package:doctors_app/features/login/data/models/request_model.dart';
import 'package:doctors_app/features/login/presentation/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  Future<void> onPressed(RequestModel model) async {
    emit(LoginLoading());
    try {
      final user=await LoginDataSource.login(model);
      await SharedPref.saveUser(user);
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailer(error: e.toString()));
    }
  }
}
