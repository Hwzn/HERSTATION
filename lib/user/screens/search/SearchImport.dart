
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hwzn_herstation/user/screens/search/widgets/SearchWidgetsImports.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/helper/configration/CustomButtonAnimation.dart';
import '../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../general/packages/localization/Localizations.dart';
import '../../../general/widgets/MyText.dart';
import '../../../res.dart';
import '../../model/providers_model/provider_data.dart';
import '../../model/providers_model/providers_model.dart';
import '../../model/schedule_days.dart';
import '../../resources/UserRepositoryImports.dart';

part  'Search.dart';
part 'SearchData.dart';