import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/constants/modals/LoadingDialog.dart';
import 'package:hwzn_herstation/general/helper/dio/http/GenericHttp.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/GlobalState.dart';
import 'package:hwzn_herstation/general/models/homeProviderModel.dart';
import 'package:hwzn_herstation/general/models/AddScheduleModel.dart';
import 'package:hwzn_herstation/general/models/wallet_model.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/ApiNames.dart';
import 'package:hwzn_herstation/user/model/providers_details_model/schedule_model.dart';
import 'package:hwzn_herstation/user/model/schedule_days.dart';
import 'package:hwzn_herstation/makeup_artist/model/wallet_model/wallet_model.dart' as c1;

import '../../general/blocks/user_cubit/user_cubit.dart';
import '../model/payment_model/payment_model.dart';
import '../model/services_model/service_model.dart';
import '../model/subscription_model/my_subscription_model.dart';
import '../model/subscription_model/subscription_model.dart';

part 'MakeupArtistRepository.dart';
part 'MakeupArtistHttpMethods.dart';
