
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hwzn_herstation/general/helper/configration/CustomButtonAnimation.dart';
import 'package:hwzn_herstation/general/helper/storage/Storage.dart';
import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/resources/GeneralRepoImports.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/res.dart';
import 'package:hwzn_herstation/user/model/general_model.dart';
import '../../../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../../../general/constants/modals/LoadingDialog.dart';
import '../../../../../general/helper/dio/utils/GlobalState.dart';
import '../../../../../general/models/user_model/user_model.dart';
import 'dialogs/UserProfileDialogsImports.dart';
import 'widgets/UserProfileWidgetsImports.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/UtilsImports.dart';

part 'UserProfile.dart';
part 'UserProfileData.dart';