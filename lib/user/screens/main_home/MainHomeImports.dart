
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/models/home_model.dart';
import 'package:hwzn_herstation/user/screens/main_home/tabs/favourites/FavouriteImports.dart';
import 'package:hwzn_herstation/user/screens/main_home/tabs/home/HomeImports.dart';
import 'package:hwzn_herstation/user/screens/main_home/tabs/my_appointment/MyAppointmentsImports.dart';
import 'package:hwzn_herstation/user/screens/main_home/widgets/MainHomeWidgetsImports.dart';

import '../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/helper/storage/Storage.dart';
import '../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../res.dart';
import 'tabs/user_profile/UserProfileImports.dart';

part 'MainHome.dart';
part 'MainHomeData.dart';