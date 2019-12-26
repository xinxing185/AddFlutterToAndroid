// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductRequest _$GetProductRequestFromJson(Map<String, dynamic> json) {
  return GetProductRequest(
      category_id: json['category_id'] as int,
      page: json['page'] as int,
      page_size: json['page_size'] as int)
    ..cmd = json['cmd'] as String;
}

Map<String, dynamic> _$GetProductRequestToJson(GetProductRequest instance) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'page': instance.page,
      'page_size': instance.page_size,
      'category_id': instance.category_id
    };
