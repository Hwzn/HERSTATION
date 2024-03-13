
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/helper/configration/CustomButtonAnimation.dart';
import 'package:hwzn_herstation/general/models/homeProviderModel.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:hwzn_herstation/makeup_artist/resources/MakeupArtistRepositoryImports.dart';
import 'package:hwzn_herstation/makeup_artist/screens/makeup_artisit_home/tabs/makeup_artist_main/dialogs/MakeupArtistHomeDialogs.dart';
import 'package:hwzn_herstation/makeup_artist/screens/makeup_artisit_home/tabs/makeup_artist_main/widgets/MakeupArtistWidgetsImports.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../../../general/constants/modals/LoadingDialog.dart';
import '../../../../../general/models/user_model/update_profile_data.dart';
import '../../../../../general/models/user_model/user_model.dart';
import '../../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../../general/packages/localization/Localizations.dart';
import '../../../../../general/resources/GeneralRepoImports.dart';
import '../../../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../../../user/model/region_model/region_model.dart';
import '../../../../../user/resources/UserRepositoryImports.dart';
import '../../../../model/update_cities_model/update_cities_model.dart';

part 'MakeupArtistMain.dart';
part 'MakeupArtistMainData.dart';

