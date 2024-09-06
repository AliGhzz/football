class Fee {
  final String? feeText;
  final String? localizedFeeText;
  final int? value;

  Fee({
    this.feeText,
    this.localizedFeeText,
    this.value,
  });

  factory Fee.fromJson(Map<String, dynamic> json) {
    return Fee(
      feeText: json['feeText'],
      localizedFeeText: json['localizedFeeText'],
      value: json['value'],
    );
  }
}