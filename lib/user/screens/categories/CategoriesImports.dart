
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';
import 'package:hwzn_herstation/user/model/providers_model/providers_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../general/packages/generic_bloc/generic_cubit.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/widgets/DefaultAppBar.dart';
import '../../model/providers_model/provider_data.dart';
import '../../resources/UserRepositoryImports.dart';
import 'widgets/CategoriesWidgetImports.dart';

part 'Categories.dart';
part 'CategoriesData.dart';