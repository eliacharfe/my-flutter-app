class Filters {
  final String value;
  final String label;
  final bool isSelected;

  Filters({
    required this.value,
    required this.label,
    required this.isSelected,
  });

  factory Filters.fromJson(Map<String, dynamic> json) {
    return Filters(
      value: json['value'] ?? "",
      label: json['label'] ?? "",
      isSelected: json['isSelected'] ?? false,
    );
  }

  Filters copyWith({
    String? value,
    String? label,
    bool? isSelected,
  }) {
    return Filters(
      value: value ?? this.value,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
