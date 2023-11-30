import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? userId,
    String? key,
    String? type,
    List<String>? assetCategory,
    String? name,
    double? total,
    String? currency,
    Map<String, dynamic>? rawData,
    dynamic mappedData,
    String? createdAt,
    String? updatedAt,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
