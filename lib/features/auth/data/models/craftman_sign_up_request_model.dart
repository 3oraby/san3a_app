import 'package:san3a_app/core/enums/role.dart';
import 'package:san3a_app/features/auth/domain/entities/craftman_sign_up_request_entity.dart';

class CraftmanSignUpRequestModel extends CraftmanSignUpRequestEntity {
  CraftmanSignUpRequestModel({
    required super.name,
    required super.craft,
    required super.email,
    required super.password,
    required super.passwordConfirm,
    required super.nationalId,
    required super.governorate,
  });


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'craft': craft,
      'email': email,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'nationalId': nationalId,
      'governorate': governorate,
      'role': Role.craftman.name,
    };
  }

  factory CraftmanSignUpRequestModel.fromEntity(CraftmanSignUpRequestEntity entity) {
    return CraftmanSignUpRequestModel(
      name: entity.name,
      craft: entity.craft,
      email: entity.email,
      password: entity.password,
      passwordConfirm: entity.passwordConfirm,
      nationalId: entity.nationalId,
      governorate: entity.governorate,
    );
  }

}