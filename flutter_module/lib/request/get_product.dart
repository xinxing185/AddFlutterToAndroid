import 'package:json_annotation/json_annotation.dart';
import 'base.dart';
import 'package:flutter_module/net/api.dart';
part 'get_product.g.dart';

@JsonSerializable()
class GetProductRequest extends BaseRequest {

  /**
   * page : 1
   * page_size : 10
   * category_id : 1
   */

  int page;
  int page_size;
  int category_id;

  GetProductRequest({this.category_id, this.page, this.page_size}) : super(Api.CMD_GET_P_LIST);

  @override
  Map<String, dynamic> toJson() {
    return _$GetProductRequestToJson(this);
  }
}
