import 'package:san3a_app/features/auth/domain/entities/customer_sign_up_request_entity.dart';

class CustomerSignUpRequestModel extends CustomerSignUpRequestEntity {
  CustomerSignUpRequestModel({
    required super.name,
    required super.email,
    required super.password,
    required super.passwordConfirm,
    required super.nationalId,
    required super.governorate,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': name,
      'email': email,
      'password': password,
      'confirmPassword': passwordConfirm,
      'nationalId': nationalId,
      'governorate': governorate,
    };
  }

  factory CustomerSignUpRequestModel.fromEntity(
    CustomerSignUpRequestEntity entity,
  ) {
    return CustomerSignUpRequestModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
      passwordConfirm: entity.passwordConfirm,
      nationalId: entity.nationalId,
      governorate: entity.governorate,
    );
  }
}
