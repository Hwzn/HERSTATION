
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hwzn_herstation/general/models/user_model/user_model.dart';
import 'package:hwzn_herstation/general/screens/edit_profile/widgets/EditProfileWidgetsImports.dart';

import '../../blocks/auth_cubit/auth_cubit.dart';
import '../../blocks/user_cubit/user_cubit.dart';
import '../../constants/MyColors.dart';
import '../../helper/configration/CustomButtonAnimation.dart';
import '../../helper/storage/Storage.dart';
import '../../models/user_model/update_profile_data.dart';
import '../../packages/generic_bloc/generic_cubit.dart';
import '../../packages/localization/Localizations.dart';
import '../../resources/GeneralRepoImports.dart';
import '../../utilities/routers/RouterImports.gr.dart';
import '../../utilities/utils_functions/UtilsImports.dart';
import '../../widgets/DefaultAppBar.dart';
import '../../widgets/LoadingButton.dart';
import 'dialogs/EditProfileDialogsImports.dart';

part 'EditProfile.dart';
part 'EditProfileData.dart';
