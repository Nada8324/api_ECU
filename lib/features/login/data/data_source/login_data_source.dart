import 'package:dio/dio.dart';
import 'package:doctors_app/features/login/data/models/request_model.dart';
import 'package:doctors_app/features/login/data/models/user_model.dart';

class LoginDataSource {
 static final Dio dio = Dio(
    BaseOptions(baseUrl: "https://vcare.integration25.com/api"),
  );
 static Future<UserModel> login(RequestModel model) async {
    final response = await dio.post("/auth/login", data: model.toJson());

    return UserModel(
      token: response.data["data"]["token"],
      name: response.data["data"]["username"],
    );
  }
}
