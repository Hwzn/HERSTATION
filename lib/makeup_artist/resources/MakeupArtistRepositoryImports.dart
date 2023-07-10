import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/constants/modals/LoadingDialog.dart';
import 'package:hwzn_herstation/general/helper/dio/http/GenericHttp.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/GlobalState.dart';
import 'package:hwzn_herstation/general/models/homeProviderModel.dart';
import 'package:hwzn_herstation/general/models/AddScheduleModel.dart';
import 'package:hwzn_herstation/general/models/user_model/user_model.dart';
import 'package:hwzn_herstation/general/models/wallet_model.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/ApiNames.dart';
import 'package:hwzn_herstation/user/model/schedule_days.dart';

import '../model/subscription_model/my_subscription_model.dart';
import '../model/subscription_model/subscription_model.dart';

part 'MakeupArtistRepository.dart';
part 'MakeupArtistHttpMethods.dart';
