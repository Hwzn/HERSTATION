import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/user/resources/UserRepositoryImports.dart';
import 'package:hwzn_herstation/user/screens/makeup_artists/rates/widgets/RatesWidgetsImports.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../general/widgets/CachedImage.dart';
import '../../../../general/widgets/DefaultAppBar.dart';
import '../../../../general/widgets/MyText.dart';
import '../../../model/providers_details_model/rate_model.dart';
import '../../../model/rates_model/rates_model.dart';

part 'RatesData.dart';
part 'Rates.dart';
