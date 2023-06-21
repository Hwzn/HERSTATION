
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hwzn_herstation/general/screens/notifications/widgets/NotificationsWidgetImports.dart';

import '../../models/notifications_model/notification_model.dart';
import '../../packages/generic_bloc/generic_cubit.dart';
import '../../packages/localization/Localizations.dart';
import '../../resources/GeneralRepoImports.dart';
import '../../utilities/routers/RouterImports.gr.dart';
import '../../utilities/utils_functions/LoadingDialog.dart';
import '../../widgets/DefaultAppBar.dart';

part 'Notifications.dart';
part 'NotificationsData.dart';