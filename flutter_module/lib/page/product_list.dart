import 'dart:convert';

import 'package:flutter_module/bridge/native_method.dart';
import 'package:flutter_module/model/category.dart';
import 'package:flutter_module/model/product.dart';
import 'package:flutter_module/model/response.dart';
import 'package:flutter_module/net/api.dart';
import 'package:flutter_module/net/http_util.dart';
import 'package:flutter_module/request/get_category.dart';
import 'package:flutter_module/request/get_product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {

  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<StatefulWidget> {
  LoadMoreStatus loadMoreStatus = LoadMoreStatus.STABLE;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();

  var products = <ProductItem>[];
  int pageIndex = 1;

  @override
  void initState() {
    _fetchProductData(pageIndex);
  }

  @override
  void dispose() {
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var contentView;
    if (products == null || products.length == 0) {
      contentView = Center(
          child: CircularProgressIndicator()
      );
    } else {
      contentView = NotificationListener(
        onNotification: _onNotification,
        child: GridView.builder(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            crossAxisCount: 2,
            childAspectRatio: 6 / 7,),
          itemBuilder: (context, i) => _buildProductItem(context, i),
          itemCount: products.length,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        ),
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "back",
          onPressed: () => NativeMethod.finishActivity(),
        ),
        elevation: 0.5,
        toolbarOpacity: 1,
        titleSpacing: 0.0,
        centerTitle: true,
        title: Text(
          "全部商品",
          style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
        ),
      ),
      body: contentView
    );
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (scrollController.position.maxScrollExtent > scrollController.offset &&
          scrollController.position.maxScrollExtent - scrollController.offset <=
              50) {
        if (loadMoreStatus != null &&
            loadMoreStatus == LoadMoreStatus.STABLE) {
          loadMoreStatus = LoadMoreStatus.LOADING;
          _fetchProductData(pageIndex);
        }
      }
    }
    return true;
  }

  _buildProductItem(BuildContext context, int i) {
    var prdImage = Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Image.network(products[i].picture,
          width: 120,
          height: 120,)
    );
    var prdInfo = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${products[i].goods_name}",
          maxLines: 2,
          semanticsLabel: products[i].introduction,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF757575),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),),
        Container(
          padding: EdgeInsets.only(top: 0),
          child: Text("￥${products[i].market_price / 100}",
              style: TextStyle(
                color: Color(0xFFE53935),
                fontWeight: FontWeight.w600,
                fontSize: 15
              )),
        ),
      ],
    );
    var rowItem = Container(
        child: Card(
          child: InkWell(
              onTap: () {
                print("Card tapped.");
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    prdImage,
                    prdInfo,
                  ],
                ),
              )
          ),
        )
    );
    return rowItem;
  }

  _onHttpError(DioError error) {
    print(error.message);
  }

  _onCategorySuccess(Response res) {
    print(res.data);
    Map<String, dynamic> map = json.decode(res.data);
    ResponseBody2<Category> responseBody = ResponseBody2<Category>.fromJson(map);
    List<Category> list = responseBody.getList(Category());
    print(list.length);
    print(list[0].category_name);
  }

  _onProductSuccess(Response res) {
    print(res.data);
    Map<String, dynamic> map = json.decode(res.data);

    ResponseBody1<Product> responseBody = ResponseBody1<Product>.fromJson(map);
    Product productList = responseBody.getData(Product());
    setState(() {
      loadMoreStatus = LoadMoreStatus.STABLE;
      if (productList.items != null && productList.items.length > 0) {
        pageIndex++;
        products.addAll(productList.items);
      }
    });
  }

  _fetchCategoryData() {
    var cReq = CategoryRequest(
        category_version: 1,
        parent_id: 0,
        is_tree: 1,
        is_children: 0
    );
    Future<Response> res = HttpUtil.post(
        Api.BASE_URL, cReq.toJson());
    res.then((onValue) =>
        _onCategorySuccess(onValue),
        onError: (e) => _onHttpError(e));
  }

  _fetchProductData(int pageIndex) {
    print("product data page=$pageIndex");

    var pReq = GetProductRequest(
      category_id: 1,
      page: pageIndex,
      page_size: 10,
    );
    Future<Response> res = HttpUtil.post(
        Api.BASE_URL, pReq.toJson());
    res.then((onValue) =>
        _onProductSuccess(onValue),
    onError: (e) => _onHttpError(e));
  }

  Future<List<ProductItem>> _fetchProductDataAsync(int pageIndex) async {
    var pReq = GetProductRequest(
      category_id: 1,
      page: pageIndex,
      page_size: 10,
    );
    Response res = await HttpUtil.post(
        Api.BASE_URL, pReq.toJson());
    if (res.statusCode == 200) {
      Map<String, dynamic> map = json.decode(res.data);
      ResponseBody1<Product> responseBody = ResponseBody1<Product>.fromJson(
          map);
      if (responseBody.code == "0") {
        Product productList = responseBody.getData(Product());
        return productList.items;
      }
    }
    return null;
  }
}

enum LoadMoreStatus { LOADING, STABLE }