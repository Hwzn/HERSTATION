
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/helper/storage/Storage.dart';
import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../../../general/constants/modals/LoadingDialog.dart';
import '../../../../../general/packages/localization/Localizations.dart';
import '../../../../model/order_model/order_model.dart';
import '../../../../resources/UserRepositoryImports.dart';
import 'widgets/MyAppointmentsWidgetsImports.dart';

part 'MyAppointments.dart';
part 'MyAppointmentsData.dart';