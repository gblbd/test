import 'Address.dart';
import 'AdvStatusHistory.dart';
import 'AmenityGroup.dart';
import 'Category.dart';
import 'CreatedBy.dart';
import 'GalleryUpload.dart';
import 'MinBooking.dart';
import 'Price.dart';
import 'ShiftingTime.dart';
import 'UpdatedBy.dart';

class Content {
  Content({
    this.id,
    this.title,
    this.slug,
    this.primaryCategory,
    this.subCategory,
    this.nicheCategory,
    this.address,
    this.lastSavedStep,
    this.advertisementStatus,
    this.description,
    this.providerType,
    this.serviceProviderType,
    this.isWorkInWeekends,
    this.studentCapacity,
    this.classPerWeek,
    this.hoursPerWeek,
    this.shiftingTimes,
    this.amenityGroups,
    this.weekDays,
    this.offDays,
    this.propertyRulesAndPolicy,
    this.price,
    this.overallSpecialPrice,
    this.minBooking,
    this.discounts,
    this.specialPrices,
    this.additionalFees,
    this.cancellationPenalties,
    this.photos,
    this.galleryUploads,
    this.avgRating,
    this.totalReview,
    this.revenue,
    this.verified,
    this.disabled,
    this.paid,
    this.publishable,
    this.phone,
    this.email,
    this.contactInfo,
    this.advStatusHistory,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? title;
  String? slug;
  String? primaryCategory;
  Category? subCategory;
  Category? nicheCategory;
  Address? address;
  String? lastSavedStep;
  String? advertisementStatus;
  String? description;
  String? providerType;
  String? serviceProviderType;
  bool? isWorkInWeekends;
  int? studentCapacity;
  int? classPerWeek;
  int? hoursPerWeek;
  List<ShiftingTime>? shiftingTimes;
  List<AmenityGroup>? amenityGroups;
  List<String>? weekDays;
  List<dynamic>? offDays;
  dynamic? propertyRulesAndPolicy;
  Price? price;
  Price? overallSpecialPrice;
  MinBooking? minBooking;
  List<dynamic>? discounts;
  List<dynamic>? specialPrices;
  List<dynamic>? additionalFees;
  List<dynamic>? cancellationPenalties;
  List<dynamic>? photos;
  List<GalleryUpload>? galleryUploads;
  double? avgRating;
  int? totalReview;
  double? revenue;
  bool? verified;
  bool? disabled;
  bool? paid;
  bool? publishable;
  String? phone;
  String? email;
  String? contactInfo;
  List<AdvStatusHistory>? advStatusHistory;
  CreatedBy? createdBy;
  UpdatedBy? updatedBy;
  int? createdAt;
  int? updatedAt;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    primaryCategory: json["primaryCategory"],
    subCategory: Category.fromJson(json["subCategory"]),
    nicheCategory: Category.fromJson(json["nicheCategory"]),
    address: Address.fromJson(json["address"]),
    lastSavedStep: json["lastSavedStep"],
    advertisementStatus: json["advertisementStatus"],
    description: json["description"],
    providerType: json["providerType"],
    serviceProviderType: json["serviceProviderType"],
    isWorkInWeekends: json["isWorkInWeekends"],
    studentCapacity: json["studentCapacity"],
    classPerWeek: json["classPerWeek"],
    hoursPerWeek: json["hoursPerWeek"],
    shiftingTimes: List<ShiftingTime>.from(json["shiftingTimes"].map((x) => ShiftingTime.fromJson(x))),
    amenityGroups: List<AmenityGroup>.from(json["amenityGroups"].map((x) => AmenityGroup.fromJson(x))),
    weekDays: List<String>.from(json["weekDays"].map((x) => x)),
    offDays: List<dynamic>.from(json["offDays"].map((x) => x)),
    propertyRulesAndPolicy: json["propertyRulesAndPolicy"],
    price: Price.fromJson(json["price"]),
    overallSpecialPrice: Price.fromJson(json["overallSpecialPrice"]),
    minBooking: MinBooking.fromJson(json["minBooking"]),
    discounts: List<dynamic>.from(json["discounts"].map((x) => x)),
    specialPrices: List<dynamic>.from(json["specialPrices"].map((x) => x)),
    additionalFees: List<dynamic>.from(json["additionalFees"].map((x) => x)),
    cancellationPenalties: List<dynamic>.from(json["cancellationPenalties"].map((x) => x)),
    photos: List<dynamic>.from(json["photos"].map((x) => x)),
    galleryUploads: List<GalleryUpload>.from(json["galleryUploads"].map((x) => GalleryUpload.fromJson(x))),
    avgRating: json["avgRating"].toDouble(),
    totalReview: json["totalReview"],
    revenue: json["revenue"].toDouble(),
    verified: json["verified"],
    disabled: json["disabled"],
    paid: json["paid"],
    publishable: json["publishable"],
    phone: json["phone"],
    email: json["email"],
    contactInfo: json["contactInfo"],
    advStatusHistory: List<AdvStatusHistory>.from(json["advStatusHistory"].map((x) => AdvStatusHistory.fromJson(x))),
    createdBy: CreatedBy.fromJson(json["createdBy"]),
    updatedBy: UpdatedBy.fromJson(json["updatedBy"]),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "primaryCategory": primaryCategory,
    "subCategory": subCategory?.toJson(),
    "nicheCategory": nicheCategory?.toJson(),
    "address": address?.toJson(),
    "lastSavedStep": lastSavedStep,
    "advertisementStatus": advertisementStatus,
    "description": description,
    "providerType": providerType,
    "serviceProviderType": serviceProviderType,
    "isWorkInWeekends": isWorkInWeekends,
    "studentCapacity": studentCapacity,
    "classPerWeek": classPerWeek,
    "hoursPerWeek": hoursPerWeek,
    "shiftingTimes": List<dynamic>.from(shiftingTimes!.map((x) => x.toJson())),
    "amenityGroups": List<dynamic>.from(amenityGroups!.map((x) => x.toJson())),
    "weekDays": List<dynamic>.from(weekDays!.map((x) => x)),
    "offDays": List<dynamic>.from(offDays!.map((x) => x)),
    "propertyRulesAndPolicy": propertyRulesAndPolicy,
    "price": price?.toJson(),
    "overallSpecialPrice": overallSpecialPrice!.toJson(),
    "minBooking": minBooking!.toJson(),
    "discounts": List<dynamic>.from(discounts!.map((x) => x)),
    "specialPrices": List<dynamic>.from(specialPrices!.map((x) => x)),
    "additionalFees": List<dynamic>.from(additionalFees!.map((x) => x)),
    "cancellationPenalties": List<dynamic>.from(cancellationPenalties!.map((x) => x)),
    "photos": List<dynamic>.from(photos!.map((x) => x)),
    "galleryUploads": List<dynamic>.from(galleryUploads!.map((x) => x.toJson())),
    "avgRating": avgRating,
    "totalReview": totalReview,
    "revenue": revenue,
    "verified": verified,
    "disabled": disabled,
    "paid": paid,
    "publishable": publishable,
    "phone": phone,
    "email": email,
    "contactInfo": contactInfo,
    "advStatusHistory": List<dynamic>.from(advStatusHistory!.map((x) => x.toJson())),
    "createdBy": createdBy?.toJson(),
    "updatedBy": updatedBy?.toJson(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}