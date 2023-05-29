
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/screens/complete_register/CompleteRegisterImports.dart';

import '../../../../res.dart';
import '../../../blocks/user_cubit/user_cubit.dart';
import '../../../constants/MyColors.dart';
import '../../../packages/generic_bloc/generic_cubit.dart';
import '../../../packages/input_fields/GenericTextField.dart';
import 'package:hwzn_herstation/general/helper/validator/Validator.dart';

import '../../../packages/localization/Localizations.dart';
import '../../../utilities/routers/RouterImports.gr.dart';
import '../../../widgets/MyText.dart';

part 'BuildCompleteRegisterInputs.dart';
part 'BuildCompleteRegisterButton.dart';
part 'BuildUploadImage.dart';