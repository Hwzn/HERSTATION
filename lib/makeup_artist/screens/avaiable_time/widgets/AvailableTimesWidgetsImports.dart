
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/models/AddScheduleModel.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/AdaptivePicker.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:hwzn_herstation/makeup_artist/screens/avaiable_time/AvailableTimesImports.dart';
import 'package:hwzn_herstation/user/model/providers_details_model/time_model.dart';
import 'package:intl/intl.dart';
// import 'package:time_pickerr/time_pickerr.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:hwzn_herstation/makeup_artist/screens/avaiable_time/AvailableTimesImports.dart';
import 'package:hwzn_herstation/general/helper/validator/Validator.dart';

import '../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../general/packages/input_fields/GenericTextField.dart';
import '../../../../user/model/providers_details_model/week_day_model.dart';
import '../../../../user/model/schedule_days.dart';
import '../../../model/days_model.dart';
import '../dialogs/AvailableTimesDialogsImports.dart';

part 'BuildTimeBody.dart';
part 'BuildMonthsBody.dart';
part 'BuildDatesBody.dart';