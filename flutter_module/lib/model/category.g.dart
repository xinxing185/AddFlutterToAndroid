// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category()
    ..category_name = json['category_name'] as String
    ..category_pic = json['category_pic'] as String
    ..description = json['description'] as String
    ..path = json['path'] as String
    ..short_name = json['short_name'] as String
    ..category_id = json['category_id'] as int
    ..is_visible = json['is_visible'] as int
    ..level = json['level'] as int
    ..pid = json['pid'] as int
    ..sort = json['sort'] as int;
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'category_name': instance.category_name,
      'category_pic': instance.category_pic,
      'description': instance.description,
      'path': instance.path,
      'short_name': instance.short_name,
      'category_id': instance.category_id,
      'is_visible': instance.is_visible,
      'level': instance.level,
      'pid': instance.pid,
      'sort': instance.sort
    };
