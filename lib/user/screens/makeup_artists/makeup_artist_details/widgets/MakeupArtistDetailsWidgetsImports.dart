import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/res.dart';
import 'package:hwzn_herstation/user/model/providers_details_model/service_model.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../../general/packages/localization/Localizations.dart';
import '../../../../../general/widgets/CachedImage.dart';
import '../../../../../general/widgets/MyText.dart';

import '../../../../model/providers_details_model/gallery_model.dart';
import '../../../../model/providers_details_model/provider_details_model.dart';
import '../../../../model/providers_details_model/rate_model.dart';
import '../MakeupArtistDetailsImports.dart';


part 'BuildAppBarBody.dart';

part 'BuildSliderMakeupArtistImages.dart';
part 'BuildServicesBody.dart';
part 'BuildGuidesBody.dart';
part 'BuildRateBody.dart';
