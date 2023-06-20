import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/general/widgets/CachedImage.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';


import '../../../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../../model/order_model/order_model.dart';
import '../../../../../model/order_model/item_model.dart';
import '../../../../../model/order_model/provider_item_model.dart';
import '../MyAppointmentsImports.dart';

part 'BuildAppointmentHeader.dart';

part 'BuildAppointmentsBody.dart';

part 'BuildAppointmentsItem.dart';
part 'BuildServicesBody.dart';
