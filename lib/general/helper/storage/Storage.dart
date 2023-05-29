import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/blocks/user_cubit/user_cubit.dart';
import 'package:hwzn_herstation/general/models/setting_model/setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model/user_model.dart';

class Storage {
  static Future<void> saveUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toJson()));
    print("user : ${json.encode(model.toJson())}");
    setUserType(model.userType!.id!);
  }

  static UserModel getSavedUser({required BuildContext context}) {
    return context.read<UserCubit>().state.model;
  }

  static Future<void> saveSettings(SettingModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("settings", json.encode(model.toJson()));

  }


  static Future<int> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("userType") ?? 2;
  }

  static Future<void> setUserType(int type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 2 -> user
    // 3 -> makeup artist
    prefs.setInt("userType", type);
  }

  static Future<String?> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", token);
  }

  static Future<String?> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lang");
  }

  static Future<void> setLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", lang);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  static int getCurrentUserId({required BuildContext context}) {
    var provider = context.watch<UserCubit>().state.model;
    return provider.id ?? 0;
  }
}
