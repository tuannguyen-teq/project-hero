import 'package:domain/domain.dart';

class UserRequest {
  final String idToken;
  final String fullName;
  final String email;
  UserRequest({
    required this.idToken,
    required this.fullName,
    required this.email,
  });

  factory UserRequest.fromParam(UserParam param) {
    return UserRequest(
      idToken: param.idToken,
      fullName: param.fullName,
      email: param.emai,
    );
  }
@override
  String toString() => 'idToken: $idToken, fullName: $fullName, email: $email';
}
