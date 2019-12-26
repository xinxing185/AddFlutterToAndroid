
import 'base.dart';

class Product extends BaseResponseData {

  /**
   * current_page : 1
   * page_size : 10
   * total_count : 23
   * total_page : 3
   * items : [{"click":0,"description":"","goods_id":1,"goods_name":"","goods_unit":"","installment_num":12,"installment_price":1597,"introduction":"","jump_url":"","market_price":17900,"picture":"","price":15900,"promotion_price":0,"sales":198,"shop_id":1,"stock":0}]
   */

  int current_page;
  int page_size;
  int total_count;
  int total_page;
  List<ProductItem> items;

  static Product fromMap(Map<String, dynamic> map) {
    Product product = new Product();
    product.current_page = map['current_page'];
    product.page_size = map['page_size'];
    product.total_count = map['total_count'];
    product.total_page = map['total_page'];
    product.items = ProductItem.fromMapList(map['items']);
    return product;
  }

  static List<Product> fromMapList(dynamic mapList) {
    if (mapList == null) return [];
    List<Product> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  @override
  createSelf(Map<String, dynamic> json) {
    return fromMap(json);
  }

}

class ProductItem {

  /**
   * description : ""
   * goods_name : ""
   * goods_unit : ""
   * introduction : ""
   * jump_url : ""
   * picture : ""
   * click : 0
   * goods_id : 1
   * installment_num : 12
   * installment_price : 1597
   * market_price : 17900
   * price : 15900
   * promotion_price : 0
   * sales : 198
   * shop_id : 1
   * stock : 0
   */

  String description;
  String goods_name;
  String goods_unit;
  String introduction;
  String jump_url;
  String picture;
  int click;
  int goods_id;
  int installment_num;
  int installment_price;
  int market_price;
  int price;
  int promotion_price;
  int sales;
  int shop_id;
  int stock;

  static ProductItem fromMap(Map<String, dynamic> map) {
    ProductItem itemsListBean = new ProductItem();
    itemsListBean.description = map['description'];
    itemsListBean.goods_name = map['goods_name'];
    itemsListBean.goods_unit = map['goods_unit'];
    itemsListBean.introduction = map['introduction'];
    itemsListBean.jump_url = map['jump_url'];
    itemsListBean.picture = map['picture'];
    itemsListBean.click = map['click'];
    itemsListBean.goods_id = map['goods_id'];
    itemsListBean.installment_num = map['installment_num'];
    itemsListBean.installment_price = map['installment_price'];
    itemsListBean.market_price = map['market_price'];
    itemsListBean.price = map['price'];
    itemsListBean.promotion_price = map['promotion_price'];
    itemsListBean.sales = map['sales'];
    itemsListBean.shop_id = map['shop_id'];
    itemsListBean.stock = map['stock'];
    return itemsListBean;
  }

  static List<ProductItem> fromMapList(dynamic mapList) {
    if (mapList == null) return [];
    List<ProductItem> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
