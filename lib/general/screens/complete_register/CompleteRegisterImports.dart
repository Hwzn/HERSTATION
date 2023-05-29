
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/screens/complete_register/widgets/CompleteRegisterWidgetsImports.dart';

import '../../helper/storage/Storage.dart';
import '../../models/completeAccountModel/CompleteAccountData.dart';
import '../../packages/generic_bloc/generic_cubit.dart';
import '../../resources/GeneralRepoImports.dart';
import '../../utilities/routers/RouterImports.gr.dart';
import '../../utilities/utils_functions/UtilsImports.dart';
import '../../widgets/AuthAppBar.dart';
import '../../widgets/AuthScaffold.dart';

part 'CompleteRegister.dart';
part 'CompleteRegisterData.dart';