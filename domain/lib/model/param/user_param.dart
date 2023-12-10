class UserParam {
  final String emai;
  final String fullName;
  final String idToken;
  UserParam({
    required this.emai,
    required this.fullName,
    required this.idToken,
  });

  @override
  bool operator ==(covariant UserParam other) {
    if (identical(this, other)) return true;
  
    return 
      other.emai == emai &&
      other.fullName == fullName &&
      other.idToken == idToken;
  }

  @override
  int get hashCode => emai.hashCode ^ fullName.hashCode ^ idToken.hashCode;

  @override
  String toString() => 'UserParam(emai: $emai, fullName: $fullName, idToken: $idToken)';
}
