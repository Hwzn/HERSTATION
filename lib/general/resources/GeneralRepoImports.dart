import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/blocks/setting_cubit/setting_cubit.dart';
import 'package:hwzn_herstation/general/constants/modals/LoadingDialog.dart';
import 'package:hwzn_herstation/general/helper/dio/http/GenericHttp.dart';
import 'package:hwzn_herstation/general/models/addServices_model.dart';
import 'package:hwzn_herstation/general/models/dropdown_model/dropdown_model.dart';
import 'package:hwzn_herstation/general/models/notifications_model/notification_model.dart';
import 'package:hwzn_herstation/general/models/setting_model/setting_model.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/ApiNames.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/LoadingDialog.dart';

import '../helper/dio/utils/GlobalState.dart';
import '../models/completeAccountModel/CompleteAccountData.dart';
import '../models/register_model/register_model.dart';
import '../models/update_address_data/update_address_data.dart';
import '../models/user_model/update_profile_data.dart';
import '../models/user_model/user_model.dart';

part 'GeneralHttpMethods.dart';
part 'GeneralRepository.dart';