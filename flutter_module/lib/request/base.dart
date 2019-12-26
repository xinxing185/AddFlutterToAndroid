
abstract class BaseRequest {
  String cmd;

  BaseRequest(this.cmd);

  Map<String, dynamic> toJson();

}