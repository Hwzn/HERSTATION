import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/helper/configration/CustomButtonAnimation.dart';
import 'package:hwzn_herstation/general/helper/helper_methods/HelperMethods.dart';
import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/resources/GeneralRepoImports.dart';
import 'package:hwzn_herstation/general/screens/location_address/LocationAddressImports.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/general/widgets/AuthScaffold.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/widgets/HeaderLogo.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';

import '../../../res.dart';
import '../../blocks/user_cubit/user_cubit.dart';
import '../../helper/storage/Storage.dart';
import '../../models/user_model/user_model.dart';
import '../../utilities/utils_functions/UtilsImports.dart';
import '../../widgets/AuthAppBar.dart';
import 'widgets/login_widgets_imports.dart';

part 'Login.dart';
part 'LoginData.dart';
