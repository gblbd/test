class Sort {
  Sort({
    this.empty,
    this.sorted,
    this.unsorted,
  });

  bool? empty;
  bool? sorted;
  bool? unsorted;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    empty: json["empty"],
    sorted: json["sorted"],
    unsorted: json["unsorted"],
  );

  Map<String, dynamic> toJson() => {
    "empty": empty,
    "sorted": sorted,
    "unsorted": unsorted,
  };
}