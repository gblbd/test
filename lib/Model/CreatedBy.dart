class CreatedBy {
  CreatedBy({
    this.userId,
    this.fullName,
    this.primaryPhoneNumber,
    this.email,
    this.profilePicture,
    this.gender,
    this.profileImage,
  });

  int? userId;
  String? fullName;
  String? primaryPhoneNumber;
  String? email;
  dynamic? profilePicture;
  dynamic? gender;
  String? profileImage;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    userId: json["userId"],
    fullName: json["fullName"],
    primaryPhoneNumber: json["primaryPhoneNumber"],
    email: json["email"],
    profilePicture: json["profilePicture"],
    gender: json["gender"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "fullName": fullName,
    "primaryPhoneNumber": primaryPhoneNumber,
    "email": email,
    "profilePicture": profilePicture,
    "gender": gender,
    "profileImage": profileImage,
  };
}