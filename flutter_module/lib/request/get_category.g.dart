// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryRequest _$CategoryRequestFromJson(Map<String, dynamic> json) {
  return CategoryRequest(
      category_version: json['category_version'] as int,
      parent_id: json['parent_id'] as int,
      is_tree: json['is_tree'] as int,
      is_children: json['is_children'] as int)
    ..cmd = json['cmd'] as String;
}

Map<String, dynamic> _$CategoryRequestToJson(CategoryRequest instance) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'category_version': instance.category_version,
      'parent_id': instance.parent_id,
      'is_tree': instance.is_tree,
      'is_children': instance.is_children
    };
