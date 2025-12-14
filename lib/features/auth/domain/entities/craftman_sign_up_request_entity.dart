class CraftmanSignUpRequestEntity {
  final String name;
  final String craft;
  final String email;
  final String password;
  final String passwordConfirm;
  final String nationalId;
  final String governorate;

  const CraftmanSignUpRequestEntity({
    required this.name,
    required this.craft,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.nationalId,
    required this.governorate,
  });
}
