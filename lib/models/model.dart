// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NumberModel {
  String? text;
  int? number;

  NumberModel({
    this.text,
    this.number,
  });

  NumberModel copyWith({
    String? text,
    int? number,
  }) {
    return NumberModel(
      text: text ?? this.text,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'number': number,
    };
  }

  factory NumberModel.fromMap(Map<String, dynamic> map) {
    return NumberModel(
      text: map['text'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NumberModel.fromJson(String source) =>
      NumberModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NumberModel(text: $text, number: $number)';

  @override
  bool operator ==(covariant NumberModel other) {
    if (identical(this, other)) return true;

    return other.text == text && other.number == number;
  }

  @override
  int get hashCode => text.hashCode ^ number.hashCode;
}
