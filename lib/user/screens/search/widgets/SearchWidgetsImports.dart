import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/general/widgets/CachedImage.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';
import 'package:hwzn_herstation/user/screens/search/SearchImport.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hwzn_herstation/general/helper/validator/Validator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../../general/packages/input_fields/GenericTextField.dart';
import '../../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../../general/widgets/LoadingButton.dart';
import '../../../../res.dart';
import '../../../model/providers_model/providers_model.dart';

part 'BuildAppBarSearch.dart';
part 'BuildOrderResultsDialog.dart';
part 'BuildOrderList.dart';
part 'BuildSearchResult.dart';
