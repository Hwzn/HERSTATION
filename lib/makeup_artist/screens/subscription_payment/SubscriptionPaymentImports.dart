import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/makeup_artist/model/apply_coupon_data/apply_coupon_data.dart';
import 'package:hwzn_herstation/makeup_artist/model/apply_coupon_model/apply_coupon_model.dart';
import 'package:hwzn_herstation/makeup_artist/screens/subscription_payment/widget/SubscriptionPaymentWidgetImports.dart';

import '../../../general/constants/modals/LoadingDialog.dart';
import '../../../general/helper/configration/CustomButtonAnimation.dart';
import '../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../general/packages/localization/Localizations.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/widgets/DefaultAppBar.dart';
import '../../model/payment_model/payment_model.dart';
import '../../model/subscription_data/supscription_data.dart';
import '../../model/subscription_model/subscription_model.dart';
import '../../resources/MakeupArtistRepositoryImports.dart';

part 'SubscriptionPayment.dart';
part 'SubscriptionPaymentData.dart';