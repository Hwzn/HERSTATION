
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/helper/helper_methods/HelperMethods.dart';
import 'package:hwzn_herstation/general/models/setting_model/setting_model.dart';
import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';
import 'package:hwzn_herstation/general/resources/GeneralRepoImports.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:hwzn_herstation/general/widgets/AuthAppBar.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:hwzn_herstation/user/screens/main_home/tabs/home/widgets/HomeWidgetsImports.dart';
import 'package:telephony/telephony.dart';

import '../../../../../general/packages/localization/Localizations.dart';




part 'Home.dart';
part 'HomeData.dart';