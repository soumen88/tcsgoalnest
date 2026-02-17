import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
abstract class ImageModel with _$ImageModel {
    const factory ImageModel({
        @JsonKey(name: "path")
        required String imagePath,
        @JsonKey(name: "alt")
        required String imageAlt,
    }) = _ImageModel;

    factory ImageModel.fromJson(Map<String, Object?> json) => _$ImageModelFromJson(json);
}