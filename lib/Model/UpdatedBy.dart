class UpdatedBy {
  UpdatedBy({
    this.userId,
    this.fullName,
    this.primaryPhoneNumber,
    this.email,
    this.profileImage,
  });

  int? userId;
  String? fullName;
  dynamic primaryPhoneNumber;
  dynamic email;
  dynamic profileImage;

  factory UpdatedBy.fromJson(Map<String, dynamic> json) => UpdatedBy(
    userId: json["userId"],
    fullName: json["fullName"],
    primaryPhoneNumber: json["primaryPhoneNumber"],
    email: json["email"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "fullName": fullName,
    "primaryPhoneNumber": primaryPhoneNumber,
    "email": email,
    "profileImage": profileImage,
  };
}