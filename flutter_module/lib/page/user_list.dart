import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/model/user.dart';
import 'package:flutter_module/net/http_util.dart';

import 'navigator_util.dart';
import 'statusbar_util.dart';

// ignore: must_be_immutable
class UserList extends StatefulWidget {
  bool isSinglePage; // 是否单页，是则返回时关闭Activity

  UserList(this.isSinglePage);

  @override
  UserListState createState() => UserListState(this.isSinglePage);
}

class UserListState extends State<StatefulWidget> {
  UserListState(this.isSinglePage);

  bool isSinglePage;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<UserBean> users = <UserBean>[];

  @override
  void initState() {
//    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    StatusBarUtil.dark(null);

    // user FutureBuilder fro loading initially
    var contentView = Container(
        child: FutureBuilder(future: _fetchDataAsync(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: Text("Loading...",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightGreen
                      ),
                    )
                );
              } else {
                users.addAll(snapshot.data);
                return Container(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
//                        print("${i} in ${users.length}");
                        if (i == users.length - 1) {
                          _fetchData();
                        }
                        return _buildUserItem(context, i);
                      },
                      itemCount: users.length,
                    )
                );
              }
            }
        )
    );
    return new WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              tooltip: "back",
              onPressed: () => NavigatorUtil.pop(context, isSinglePage),
            ),
            elevation: 0.5,
            toolbarOpacity: 1,
            titleSpacing: 0.0,
            centerTitle: true,
            title: Text(
              "标准AppBar",
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
            ),
          ),
          body:
          Container(
              child: Center(
                child: contentView,
              )
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  _buildUserItem(BuildContext context, int i) {
    var prdImage = Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CircleAvatar(
        backgroundImage: NetworkImage(users[i].avatar),
        backgroundColor: Color(0xFF42A5F5),
        radius: 20,
      ),
    );
    var prdImage2 = Container(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
      child: CircleAvatar(
        radius: 22,
        child: ClipOval(
          child: SizedBox(
            child: Image.network(users[i].avatar,
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
    var prdInfo = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${users[i].first_name} ${users[i].last_name}",
          style: TextStyle(
            color: Color(0xFF536DFE),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),),
        Container(
          padding: EdgeInsets.only(top: 5),
          child: Text("E-mail: ${users[i].email}",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              )),
        ),
      ],
    );
    var rowItem = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            prdImage,
            Expanded(
              child: prdInfo,
            )
          ],
        ),
        Divider(color: Colors.indigoAccent)
      ],
    );
    return rowItem;
  }

  _onHttpError(DioError error) {
    _snakeBarTips(error.message);
  }

  _onHttpSuccess(Response res) {
    var prds = UsersBean
        .fromMap(res.data);
    _snakeBarTips("data success ${prds.total}");
    if (mounted) {
      setState(() {
        users.addAll(prds.data);
//      users = prds.data;
      });
    }
  }

  _fetchData() {
    Future<Response> res = HttpUtil.get(
        "https://reqres.in/api/users", {"page": 1, "per_page": 14});
    res.then((onValue) =>
        _onHttpSuccess(onValue),
    onError: (e) => _onHttpError(e));
  }

  Future<List<UserBean>> _fetchDataAsync() async {
    Response res = await HttpUtil.get(
        "https://reqres.in/api/users", {"page": 1, "per_page": 14});
    return _parseUserData(res);
//    return compute(_parseUserData, res.data.toString());
  }

  List<UserBean> _parseUserData(Response res) {
    var prds = UsersBean.fromMap(res.data);
    return prds.data;
  }

  _snakeBarTips(String msg) {
    var snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 2), // 持续时间
    );

    _scaffoldKey.currentState?.showSnackBar(snackBar);
  }


  Future<bool> _onBackPressed() {
    NavigatorUtil.pop(context, isSinglePage);
    return Future.value(false);
  }
}
