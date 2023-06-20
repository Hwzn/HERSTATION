
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:hwzn_herstation/general/constants/modals/LoadingDialog.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/DioUtils.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/GlobalState.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

part 'DioHelperStatus.dart';
