class CustomerSignUpRequestEntity {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;
  final String nationalId;
  final String governorate;

  const CustomerSignUpRequestEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.nationalId,
    required this.governorate,
  });
}
