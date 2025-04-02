class Loginmodels {
  final String email;
  final String otp;

  Loginmodels({required this.email, required this.otp});
  // factory Loginmodels.fromjson(Map<String, dynamic> Json) {
  //   return Loginmodels(email: Json['email'], password: Json['password']);
  // }
}
