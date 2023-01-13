class UserProfile {
  String use_id;
  String email;
  bool admin;
  UserProfile(this.use_id, this.email, this.admin);
  factory UserProfile.fromJson(Map<dynamic, dynamic> map) {
    return UserProfile(map["use_id"], map["email"], map["admin"]);
  }
}
