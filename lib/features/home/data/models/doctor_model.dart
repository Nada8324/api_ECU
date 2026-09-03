class DoctorModel {
  final String name;
  final String photo;
  final String address;
  final String specialization;
  final int appointPrice;
  final String startTime;

  DoctorModel({
    required this.name,
    required this.photo,
    required this.address,
    required this.specialization,
    required this.appointPrice,
    required this.startTime,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      address: json['address'],
      appointPrice: json['appoint_price'],
      photo: json['photo'],
      specialization: json['specialization']['name'],
      startTime: json['start_time']
    );
  }
}
