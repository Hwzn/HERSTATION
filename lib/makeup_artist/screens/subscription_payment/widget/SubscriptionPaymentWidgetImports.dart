import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_sell_sdk_flutter/go_sell_sdk_flutter.dart';
import 'package:go_sell_sdk_flutter/model/models.dart';

import '../../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../../general/constants/MyColors.dart';
import '../../../../general/constants/modals/LoadingDialog.dart';
import '../../../../general/packages/input_fields/GenericTextField.dart';
import '../../../../general/packages/localization/Localizations.dart';
import '../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../general/widgets/DefaultButton.dart';
import '../../../../general/widgets/LoadingButton.dart';
import '../../../../general/widgets/MyText.dart';
import '../../../model/subscription_model/subscription_model.dart';
import '../SubscriptionPaymentImports.dart';

part 'BuildApplyCode.dart';
part 'BuildPaymentButton.dart';
part 'BuildServicesView.dart';