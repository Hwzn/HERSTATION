import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/makeup_artist/screens/select_regions/widgets/SelectRegionsWidgetsImports.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/constants/modals/LoadingDialog.dart';
import '../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../general/packages/localization/Localizations.dart';
import '../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/widgets/DefaultAppBar.dart';
import '../../../general/widgets/MyText.dart';
import '../../../user/model/region_model/region_model.dart';
import '../../../user/resources/UserRepositoryImports.dart';
import '../../model/update_cities_model/update_cities_model.dart';
import '../../resources/MakeupArtistRepositoryImports.dart';

part 'SelectRegions.dart';
part 'SelectRegionsData.dart';