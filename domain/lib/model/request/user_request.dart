import 'package:domain/domain.dart';

class UserRequest {
  final String idToken;
  final String fullName;
  final String userName;
  UserRequest({
    required this.idToken,
    required this.fullName,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idToken': idToken,
      'fullName': fullName,
      'userName': userName,
    };
  }

  factory UserRequest.fromParam(UserParam param) {
    return UserRequest(
      idToken: param.idToken,
      fullName: param.fullName,
      userName: param.userName,
    );
  }
}
