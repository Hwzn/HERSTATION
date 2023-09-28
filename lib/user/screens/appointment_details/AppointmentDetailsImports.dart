import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hwzn_herstation/general/widgets/DefaultAppBar.dart';
import 'package:hwzn_herstation/makeup_artist/model/payment_model/payment_model.dart';
import 'package:hwzn_herstation/makeup_artist/resources/MakeupArtistRepositoryImports.dart';
import 'package:hwzn_herstation/user/model/rates_model/rate_data.dart';
import 'package:hwzn_herstation/user/screens/appointment_details/widgets/AppointmentDetailsWidgetsImports.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/helper/configration/CustomButtonAnimation.dart';
import '../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../general/packages/localization/Localizations.dart';
import '../../../../general/widgets/MyText.dart';
import '../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../model/order_model/order_model.dart';
import '../../resources/UserRepositoryImports.dart';
import 'dialogs/AppointmentDetailsDialogsImports.dart';

part 'AppointmentDetails.dart';
part 'AppointmentDetailsData.dart';