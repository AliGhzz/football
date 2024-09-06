class TransferType {
  final String? text;
  final String? localizationKey;

  TransferType({
     this.text,
     this.localizationKey,
  });

  factory TransferType.fromJson(Map<String, dynamic> json) {
    return TransferType(
      text: json['text'],
      localizationKey: json['localizationKey'],
    );
  }
}
