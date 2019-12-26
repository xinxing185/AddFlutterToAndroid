
class UsersBean {
  /**
   * page : 1
   * per_page : 3
   * total : 12
   * total_pages : 4
   * data : [{"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg"},{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"},{"id":3,"email":"emma.wong@reqres.in","first_name":"Emma","last_name":"Wong","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/olegpogodaev/128.jpg"}]
   */

  int page;
  int per_page;
  int total;
  int total_pages;
  List<UserBean> data;

  static UsersBean fromMap(Map<String, dynamic> map) {
    UsersBean product = new UsersBean();
    product.page = map['page'];
    product.per_page = map['per_page'];
    product.total = map['total'];
    product.total_pages = map['total_pages'];
    product.data = UserBean.fromMapList(map['data']);
    return product;
  }

  static List<UsersBean> fromMapList(dynamic mapList) {
    if (mapList == null) return [];
    List<UsersBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class UserBean {
  /**
   * email : "george.bluth@reqres.in"
   * first_name : "George"
   * last_name : "Bluth"
   * avatar : "https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg"
   * id : 1
   */

  String email;
  String first_name;
  String last_name;
  String avatar;
  int id;

  static UserBean fromMap(Map<String, dynamic> map) {
    UserBean dataListBean = new UserBean();
    dataListBean.email = map['email'];
    dataListBean.first_name = map['first_name'];
    dataListBean.last_name = map['last_name'];
    dataListBean.avatar = map['avatar'];
    dataListBean.id = map['id'];
    return dataListBean;
  }

  static List<UserBean> fromMapList(dynamic mapList) {
    if (mapList == null) return [];
    List<UserBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
