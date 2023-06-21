
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/helper/configration/CustomButtonAnimation.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/widgets/DefaultAppBar.dart';
import 'package:hwzn_herstation/general/widgets/LoadingButton.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:hwzn_herstation/makeup_artist/screens/avaiable_time/widgets/AvailableTimesWidgetsImports.dart';
import 'package:hwzn_herstation/user/model/providers_details_model/week_day_model.dart';
import 'package:intl/intl.dart';

import '../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../user/model/schedule_days.dart';
import 'dialogs/AvailableTimesDialogsImports.dart';

part 'AvailableTimes.dart';
part 'AvailableTimesData.dart';