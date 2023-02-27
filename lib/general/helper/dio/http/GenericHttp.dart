import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/helper/dio/dio_helper/DioImports.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/DioUtils.dart';

enum ReturnType { model, list, type }
enum MethodType { get, post, put, patch, delete }

class GenericHttp<T>{
  final BuildContext context;


  GenericHttp(this.context);

  Future<dynamic> callApi(
      {required ReturnType returnType,
        required MethodType methodType,
        required String name,
        Function(dynamic data)? returnDataFun,
        Map<String, dynamic>? json,
        bool? showLoader,
        Function(dynamic data)? toJsonFunc,
        bool refresh = true}) async {
    var dataJson = json??{};
    dataJson.addAll({"lang": DioUtils.lang});

    // final connected = await NetworkInfo.isConnected();
    // if (!connected) {
    //   return CustomToast.showSimpleToast(msg: "Network connection failed");
    // }

    switch (methodType) {
    case MethodType.get:
        return _getData(
            name: name,
            returnType: returnType,
            refresh: refresh,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.post:
        return _postData(
            name: name,
            returnType: returnType,
            json: dataJson,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.patch:
        return _patchData(
            name: name,
            returnType: returnType,
            json: dataJson,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.put:
        return _putData(
            name: name,
            returnType: returnType,
            json: dataJson,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.delete:
        return _deleteData(
            name: name,
            returnType: returnType,
            json: dataJson,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
    }
  }

  Future<dynamic> _getData({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    bool refresh = true,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(context: context, forceRefresh: refresh).get(url: name);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {},dataKeyFun);
  }

  Future<dynamic> _postData({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(
      context: context,
    ).post(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {},dataKeyFun);
  }

  Future<dynamic> _putData({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(
      context: context,
    ).put(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {},dataKeyFun);
  }

  Future<dynamic> _patchData({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(
      context: context,
    ).patch(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {},dataKeyFun);
  }

  Future<dynamic> _deleteData({
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper(
      context: context,
    ).delete(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {},dataKeyFun);
  }

  dynamic _returnDataFromType(
      dynamic data,
      ReturnType returnType,
      Function(dynamic data) toJsonFunc,
      Function(dynamic data)? dataKeyFun,
      ) async {
    switch (returnType) {
      case ReturnType.type:
        return dataKeyFun==null?data : Function.apply(dataKeyFun, [data]);
      case ReturnType.model:
        return  Function.apply(toJsonFunc, [dataKeyFun==null?data:
        Function.apply(dataKeyFun, [data])
        ]);
      case ReturnType.list:
        return List<T>.from(
          dataKeyFun==null?data: Function.apply(dataKeyFun, [data]).map(
                (e) => Function.apply(toJsonFunc, [e]),
          ),
        );
    }
  }
}
