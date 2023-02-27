
import 'package:hwzn_herstation/general/packages/generic_bloc/generic_cubit.dart';

class WelcomeEntity {
  String? image;
  String? desc;
  String? title;
  bool last;
  int? index;
  GenericBloc<double>? pageCubit;

  WelcomeEntity({
    this.image,
    this.title,
    this.desc,
    this.last = false,
    this.index,
    this.pageCubit,
  });
}
