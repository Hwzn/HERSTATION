
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/blocks/user_cubit/user_cubit.dart';
import 'package:hwzn_herstation/general/helper/validator/Validator.dart';
import 'package:hwzn_herstation/general/models/user_model/user_model.dart';
import 'package:hwzn_herstation/general/screens/edit_profile/EditProfileImports.dart';

import '../../../../res.dart';
import '../../../constants/MyColors.dart';
import '../../../packages/generic_bloc/generic_cubit.dart';
import '../../../packages/input_fields/GenericTextField.dart';
import '../../../packages/localization/Localizations.dart';
import '../../../utilities/routers/RouterImports.gr.dart';
import '../../../widgets/CachedImage.dart';
import '../../../widgets/LoadingButton.dart';
import '../../../widgets/MyText.dart';

part 'BuildEditProfileInputs.dart';
part 'BuildChangePasswordInputs.dart';
part 'BuildUploadImage.dart';