
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hwzn_herstation/user/model/providers_details_model/service_model.dart';
import 'package:hwzn_herstation/user/model/request_order_data/service_item_model.dart';
import 'package:hwzn_herstation/user/screens/makeup_artists/service_request/pages/payment/widgets/PaymentWidgetsImports.dart';

import '../../../../../../general/constants/MyColors.dart';
import '../../../../../../general/constants/modals/LoadingDialog.dart';
import '../../../../../../general/helper/configration/CustomButtonAnimation.dart';
import '../../../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../../../general/packages/localization/Localizations.dart';
import '../../../../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../../../general/widgets/LoadingButton.dart';
import '../../../../../model/request_order_data/request_order_data.dart';
import '../../../../../resources/UserRepositoryImports.dart';
import '../../ServiceRequestImports.dart';

part 'Payment.dart';
part 'PaymentData.dart';