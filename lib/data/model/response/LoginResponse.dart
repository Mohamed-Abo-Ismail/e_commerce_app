/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"mohamedesmaile6@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZTlhMzY0Y2NlYzhjNmYzYTQ4MzRiMSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI2Njg5MTk2LCJleHAiOjE3MzQ0NjUxOTZ9.G6EG9XHgpEkohsPj9qmbHXd0Dq4FMxiuCEpAlwDIIoE"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user, 
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// name : "Ahmed Abd Al-Muti"
/// email : "mohamedesmaile6@gmail.com"
/// role : "user"

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}