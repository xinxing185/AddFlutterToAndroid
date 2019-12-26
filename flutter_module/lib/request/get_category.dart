import 'package:json_annotation/json_annotation.dart';
import 'base.dart';
import 'package:flutter_module/net/api.dart';
part 'get_category.g.dart';

@JsonSerializable()
class CategoryRequest extends BaseRequest {
  // request.category_version = 1
  //        request.parent_id = 0
  //        request.is_tree = 1
  //        request.is_children = 0
  int category_version;
  int parent_id;
  int is_tree;
  int is_children;

  CategoryRequest({this.category_version, this.parent_id, this.is_tree, this.is_children}) : super(Api.CMD_GET_CATEGORY);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryRequestToJson(this);
  }

}