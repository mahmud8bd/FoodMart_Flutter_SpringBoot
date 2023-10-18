import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String firstname;
  String lastname;
  String email;
  String password;
  String role;
  bool enabled;
  bool accountNonExpired;
  bool credentialsNonExpired;
  bool accountNonLocked;
  List<Authority> authorities;
  String username;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.role,
    required this.enabled,
    required this.accountNonExpired,
    required this.credentialsNonExpired,
    required this.accountNonLocked,
    required this.authorities,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    enabled: json["enabled"],
    accountNonExpired: json["accountNonExpired"],
    credentialsNonExpired: json["credentialsNonExpired"],
    accountNonLocked: json["accountNonLocked"],
    authorities: List<Authority>.from(json["authorities"].map((x) => Authority.fromJson(x))),
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "password": password,
    "role": role,
    "enabled": enabled,
    "accountNonExpired": accountNonExpired,
    "credentialsNonExpired": credentialsNonExpired,
    "accountNonLocked": accountNonLocked,
    "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
    "username": username,
  };
}

class Authority {
  String authority;

  Authority({
    required this.authority,
  });

  factory Authority.fromJson(Map<String, dynamic> json) => Authority(
    authority: json["authority"],
  );

  Map<String, dynamic> toJson() => {
    "authority": authority,
  };
}
