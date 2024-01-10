class GalleryUpload {
  GalleryUpload({
    this.type,
    this.category,
    this.path,
  });

  String? type;
  String? category;
  String? path;

  factory GalleryUpload.fromJson(Map<String, dynamic> json) => GalleryUpload(
    type: json["type"],
    category: json["category"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "category": category,
    "path": path,
  };
}