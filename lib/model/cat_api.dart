import 'package:json_annotation/json_annotation.dart';
part 'cat_api.g.dart';

@JsonSerializable()
class Cat {
  Cat({this.fact, this.length});

  String? fact;
  int? length;

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}
