import 'package:domain/domain.dart';

class UserDto {
  final String id;
  final String fullName;
  final String email;
  final String userName;

  UserDto({
    required this.id,
    this.fullName = '',
    this.email = '',
    this.userName = '',
  });

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      userName: map['userName'] as String,
    );
  }

  User get toDomain => User(
        id: id,
        fullName: fullName,
        email: email,
        userName: userName,
      );
}
