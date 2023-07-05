
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/user/screens/makeup_artists/service_request/pages/place/widgets/PlaceWidgetsImports.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:hwzn_herstation/general/helper/validator/Validator.dart';

import '../../../../../../general/constants/MyColors.dart';
import '../../../../../../general/constants/custom_ drop_down/CustomDropDown.dart';
import '../../../../../../general/constants/modals/LoadingDialog.dart';
import '../../../../../../general/helper/configration/CustomButtonAnimation.dart';
import '../../../../../../general/models/dropdown_model/dropdown_model.dart';
import '../../../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../../../general/packages/localization/Localizations.dart';
import '../../../../../../general/widgets/LoadingButton.dart';
import '../../../../../model/providers_details_model/schedule_model.dart';
import '../../../../../model/providers_details_model/time_model.dart';
import '../../../../../model/providers_details_model/week_day_model.dart';
import '../../../../../model/region_model/city_model.dart';
import '../../../../../model/region_model/region_model.dart';
import '../../../../../model/request_order_data/request_order_data.dart';
import '../../../../../resources/UserRepositoryImports.dart';
import '../../ServiceRequestImports.dart';
import 'package:quiver/time.dart';

part 'Place.dart';
part 'PlaceData.dart';