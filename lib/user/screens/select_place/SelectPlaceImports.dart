import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/user/screens/select_place/widgets/SelectPlaceWidgetsImports.dart';

import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/constants/modals/LoadingDialog.dart';
import '../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../general/packages/localization/Localizations.dart';
import '../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../general/widgets/DefaultAppBar.dart';
import '../../../general/widgets/MyText.dart';
import '../../model/region_model/region_model.dart';
import '../../resources/UserRepositoryImports.dart';

part 'SelectPlace.dart';

part 'SelectPlaceData.dart';
