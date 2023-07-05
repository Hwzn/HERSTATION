
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
 import 'package:flutter_geocoder/geocoder.dart' as c1;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:hwzn_herstation/general/models/home_model.dart';
import 'package:hwzn_herstation/user/screens/main_home/tabs/favourites/FavouriteImports.dart';
import 'package:hwzn_herstation/user/screens/main_home/tabs/home/HomeImports.dart';
import 'package:hwzn_herstation/user/screens/main_home/tabs/my_appointment/MyAppointmentsImports.dart';
import 'package:hwzn_herstation/user/screens/main_home/widgets/MainHomeWidgetsImports.dart';

import '../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/modals/LoadingDialog.dart';
import '../../../general/helper/storage/Storage.dart';
import '../../../general/models/LocationModel.dart';
import '../../../general/models/update_address_data/update_address_data.dart';
import '../../../general/models/user_model/user_model.dart';
import '../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../general/resources/GeneralRepoImports.dart';

import '../../../general/screens/location_address/location_cubit/location_cubit.dart';
import '../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../res.dart';
import 'tabs/user_profile/UserProfileImports.dart';

part 'MainHome.dart';
part 'MainHomeData.dart';