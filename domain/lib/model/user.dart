class User {
  final String id;
  final String fullName;
  final String email;
  final String userName;
  User({
    required this.id,
    this.fullName = '',
    this.email = '',
    this.userName = '',
  });

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? userName,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      userName: userName ?? this.userName,
    );
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.email == email &&
        other.userName == userName;
  }

  @override
  int get hashCode {
    return id.hashCode ^ fullName.hashCode ^ email.hashCode ^ userName.hashCode;
  }

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, email: $email, userName: $userName)';
  }
}
