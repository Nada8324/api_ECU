class DoctorModel {
  final String name;
  final String photo;
  final String address;
  final String specialization;
  final int price;
  final String startTime;

  DoctorModel({
    required this.name,
    required this.photo,
    required this.address,
    required this.specialization,
    required this.price,
    required this.startTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json["name"],
      photo: json["photo"],
      address: json["address"],
      specialization: json["specialization"]["name"],
      price: json["appoint_price"],
      startTime: json['start_time'],
    );
  }
}
