import 'dart:convert';

class Drugs {
  String code;
  String genericNameDosageFormStrength;
  String unitOfPricing;
  dynamic price;
  String levelOfPrescibing;
  Drugs({
    required this.code,
    required this.genericNameDosageFormStrength,
    required this.unitOfPricing,
    required this.price,
    required this.levelOfPrescibing,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'genericNameDosageFormStrength': genericNameDosageFormStrength,
      'unitOfPricing': unitOfPricing,
      'price': price,
      'levelOfPrescibing': levelOfPrescibing,
    };
  }

  factory Drugs.fromJson(Map<String, dynamic> json) {
    return Drugs(
      code: json['CODE'] as String,
      genericNameDosageFormStrength: json['GENERIC NAME, DOSGE FORM, STRENGTH'],
      unitOfPricing: json['UNIT OF PRICING'] as String,
      price: json['PRICE (GHC)'],
      levelOfPrescibing: json['LEVEL OF PRESCRIBING'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Drugs.fromMap(String source) => Drugs.fromJson(json.decode(source));

  @override
  String toString() {
    return 'Drugs(code: $code, genericNameDosageFormStrength: $genericNameDosageFormStrength, unitOfPricing: $unitOfPricing, price: $price, levelOfPrescibing: $levelOfPrescibing)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Drugs &&
        other.code == code &&
        other.genericNameDosageFormStrength == genericNameDosageFormStrength &&
        other.unitOfPricing == unitOfPricing &&
        other.price == price &&
        other.levelOfPrescibing == levelOfPrescibing;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        genericNameDosageFormStrength.hashCode ^
        unitOfPricing.hashCode ^
        price.hashCode ^
        levelOfPrescibing.hashCode;
  }
}
