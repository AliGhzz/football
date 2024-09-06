class Position {
  final String? label;
  final String? key;

  Position({
    this.label,
    this.key,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      label: json['label'],
      key: json['key'],
    );
  }
}