
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:hwzn_herstation/user/screens/main_home/tabs/favourites/widgets/FavouriteWidgetImports.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';

import '../../../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../../../general/constants/modals/LoadingDialog.dart';
import '../../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../../general/packages/localization/Localizations.dart';
import '../../../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../model/providers_model/providers_model.dart';
import '../../../../resources/UserRepositoryImports.dart';


part 'Favourite.dart';
part 'FavouriteData.dart';