import 'package:dio/dio.dart';
import 'package:doctors_app/features/home/data/models/doctor_model.dart';

class HomeDataSource {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: "https://vcare.integration25.com/api"),
  );

 static Future<List<DoctorModel>> getData() async {
  //#########Login##############
    Map<String, String> user = {
      "email": "ahmednada@gmail.com",
      "password": "123666",
    };

    final authResponse = await dio.post("/auth/login", data: user);
    final String token = authResponse.data["data"]["token"];


//###########get data##############
    final response = await dio.get(
      "/doctor/index",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    final List listOfData = response.data["data"];
    final List<DoctorModel> doctors = [];
    for (int i = 0; i < listOfData.length; i++) {
      doctors.add(DoctorModel.fromJson(listOfData[i]));
    }
    return doctors;
  }
}
