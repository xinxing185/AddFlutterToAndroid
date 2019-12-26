import 'package:json_annotation/json_annotation.dart';

import 'base.dart';
part 'category.g.dart';

@JsonSerializable()
class Category extends BaseResponseData {

  /**
   * category_name : "新品上架"
   * category_pic : ""
   * description : ""
   * path : "0,1"
   * short_name : ""
   * category_id : 1
   * is_visible : 1
   * level : 0
   * pid : 0
   * sort : 1
   */
  String category_name;
  String category_pic;
  String description;
  String path;
  String short_name;
  int category_id;
  int is_visible;
  int level;
  int pid;
  int sort;

  Category();

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  createSelf(Map<String, dynamic> json) {
    return Category.fromJson(json);
  }

}
