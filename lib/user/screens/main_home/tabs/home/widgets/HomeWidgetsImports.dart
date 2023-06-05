
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:hwzn_herstation/general/models/home_model/provider_model.dart';

import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/res.dart';

import '../../../../../../general/constants/MyColors.dart';
import '../../../../../../general/models/home_model/banner_model.dart';
import '../../../../../../general/models/home_model/category_model.dart';
import '../../../../../../general/packages/localization/Localizations.dart';
import '../../../../../../general/widgets/CachedImage.dart';
import '../../../../../../general/widgets/MyText.dart';
import '../HomeImports.dart';
part 'BuildCategoriesBody.dart';
part 'BuildMakeupArtistsBody.dart';
part 'BuildSliderBody.dart';
part 'BuildDotsSlider.dart';