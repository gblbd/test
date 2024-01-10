class MinBooking {
  MinBooking({
    this.bookingType,
    this.minBookingTime,
  });

  String? bookingType;
  int? minBookingTime;

  factory MinBooking.fromJson(Map<String, dynamic> json) => MinBooking(
    bookingType: json["bookingType"],
    minBookingTime: json["minBookingTime"],
  );

  Map<String, dynamic> toJson() => {
    "bookingType": bookingType,
    "minBookingTime": minBookingTime,
  };
}
