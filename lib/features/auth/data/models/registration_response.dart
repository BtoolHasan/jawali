import 'package:equatable/equatable.dart';

class RegistrationResponse extends Equatable {
  final String? message;
  final UserModel? user;
  final String? accessToken;

  const RegistrationResponse({this.message, this.user, this.accessToken});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      message: json['message'] as String?,
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      accessToken: json['access_token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'access_token': accessToken,
      };

  @override
  List<Object?> get props => [message, user, accessToken];
}

class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? createdAt;
  final String? updatedAt;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  @override
  List<Object?> get props => [id, name, email, createdAt, updatedAt];
}