import 'package:dio/dio.dart';
import 'package:doctors_app/features/register/data/models/register_model.dart';

class RegisterDataSource {
 static final Dio dio=Dio(
   BaseOptions(baseUrl: "https://vcare.integration25.com/api")
  );
  
  static Future<void> signUp(RegisterModel model) async {
  await dio.post("/auth/register",data: model.toJson());
  }
}