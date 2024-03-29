
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/DioUtils.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/user/model/providers_details_model/service_model.dart';
import 'package:hwzn_herstation/user/screens/makeup_artists/makeup_artist_details/widgets/MakeupArtistDetailsWidgetsImports.dart';
import 'package:hwzn_herstation/user/screens/makeup_artists/service_request/ServiceRequestImports.dart';

import '../../../../general/helper/configration/CustomButtonAnimation.dart';
import '../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../general/widgets/DefaultAppBar.dart';
import '../../../../general/widgets/LoadingButton.dart';
import '../../../model/providers_details_model/provider_details_model.dart';
import '../../../resources/UserRepositoryImports.dart';

part 'MakeupArtistDetails.dart';
part 'MakeupArtistDetailsData.dart';