// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBody1<T> _$ResponseBody1FromJson<T extends BaseResponseData>(
    Map<String, dynamic> json) {
  return ResponseBody1<T>(
      json['code'] as String, json['msg'] as String, json['crypt'] as String,
      data: json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResponseBody1ToJson<T extends BaseResponseData>(
        ResponseBody1<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'crypt': instance.crypt,
      'data': instance.data
    };

ResponseBody2<T> _$ResponseBody2FromJson<T extends BaseResponseData>(
    Map<String, dynamic> json) {
  return ResponseBody2<T>(
      json['code'] as String, json['msg'] as String, json['crypt'] as String,
      data: json['data'] as List);
}

Map<String, dynamic> _$ResponseBody2ToJson<T extends BaseResponseData>(
        ResponseBody2<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'crypt': instance.crypt,
      'data': instance.data
    };
