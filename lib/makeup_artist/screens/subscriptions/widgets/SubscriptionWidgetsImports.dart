
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_sell_sdk_flutter/go_sell_sdk_flutter.dart';
import 'package:go_sell_sdk_flutter/model/models.dart';
import 'package:hwzn_herstation/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:hwzn_herstation/general/blocks/user_cubit/user_cubit.dart';
import 'package:hwzn_herstation/general/helper/storage/Storage.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/widgets/DefaultButton.dart';
import 'package:hwzn_herstation/general/widgets/LoadingButton.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:hwzn_herstation/makeup_artist/screens/subscriptions/SubscriptionsImports.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../general/constants/MyColors.dart';
import '../../../model/subscription_model/subscription_model.dart';

import 'package:hwzn_herstation/general/constants/modals/LoadingDialog.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/LoadingDialog.dart';
part 'BuildRenewSubscribeBody.dart';
part 'BuildSubscribeBody.dart';