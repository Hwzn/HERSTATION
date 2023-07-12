import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hwzn_herstation/general/helper/configration/CustomButtonAnimation.dart';
import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/makeup_artist/screens/subscriptions/widgets/SubscriptionWidgetsImports.dart';
import 'package:hwzn_herstation/makeup_artist/resources/MakeupArtistRepositoryImports.dart';

import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/widgets/DefaultAppBar.dart';
import '../../model/payment_model/payment_model.dart';
import '../../model/subscription_model/subscription_model.dart';

part 'Subscriptions.dart';

part 'SubscriptionsData.dart';
