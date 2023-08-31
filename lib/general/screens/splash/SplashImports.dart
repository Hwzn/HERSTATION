import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hwzn_herstation/general/blocks/auth_cubit/auth_cubit.dart';
import 'package:hwzn_herstation/general/helper/configration/InitUtils.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/GlobalState.dart';
import 'package:hwzn_herstation/general/helper/fcm/GlobalNotification.dart';
import 'package:hwzn_herstation/general/helper/helper_methods/HelperMethods.dart';
import 'package:hwzn_herstation/general/helper/storage/Storage.dart';
import 'package:hwzn_herstation/general/packages/animation_container/AnimationContainer.dart';
import 'package:hwzn_herstation/general/resources/GeneralRepoImports.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/UtilsImports.dart';
import 'package:hwzn_herstation/res.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blocks/lang_cubit/lang_cubit.dart';
import '../../blocks/setting_cubit/setting_cubit.dart';
import '../../blocks/user_cubit/user_cubit.dart';
import '../../models/setting_model/setting_model.dart';
import '../../models/user_model/user_model.dart';

part 'Splash.dart';
part 'SplashData.dart';