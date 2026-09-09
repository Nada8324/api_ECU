class RegisterModel {
  final String name;
  final String phone;
  final String email;
  final String gender;
  final String password;
  final String conformationPassword;

  RegisterModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.password,
    required this.conformationPassword,
  });

  Map<String,dynamic> toJson(){
    return {
     "name":name,
     "email":email,
     "phone":phone,
     "gender":gender,
     "password":password,
     "password_confirmation":conformationPassword
    };
  }
}
