import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/constants/modals/LoadingDialog.dart';
import 'package:hwzn_herstation/general/helper/configration/CustomButtonAnimation.dart';
import 'package:hwzn_herstation/general/helper/helper_methods/HelperMethods.dart';
import 'package:hwzn_herstation/general/helper/storage/Storage.dart';
import 'package:hwzn_herstation/general/models/dropdown_model/dropdown_model.dart';
import 'package:hwzn_herstation/general/models/register_model/RegisterModel.dart';
import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';
import 'package:hwzn_herstation/general/resources/GeneralRepoImports.dart';
import 'package:hwzn_herstation/general/screens/register/widgets/RegisterWidgetsImports.dart';
import 'package:hwzn_herstation/general/widgets/AuthAppBar.dart';
import 'package:hwzn_herstation/general/widgets/HeaderLogo.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';

import '../../../res.dart';
import '../../constants/MyColors.dart';
import '../../constants/custom_ drop_down/CustomDropDown.dart';
import '../../packages/localization/Localizations.dart';
import '../../utilities/routers/RouterImports.gr.dart';
import '../../widgets/AuthScaffold.dart';
import 'package:auto_route/auto_route.dart';

part 'Register.dart';
part 'RegisterData.dart';