part of 'MainDataImports.dart';


class MainData {

  static List<BlocProvider>  providers(BuildContext context)=>[
    BlocProvider<SettingCubit>(
      create: (BuildContext context)=> SettingCubit()
    ),
    BlocProvider<AuthCubit>(
      create: (BuildContext context)=> AuthCubit()
    ),
    BlocProvider<UserCubit>(
      create: (BuildContext context)=> UserCubit()
    ),
    BlocProvider<NotifyCubit>(
      create: (BuildContext context)=> NotifyCubit()
    ),
    BlocProvider<LangCubit>(
        create: (BuildContext context)=> LangCubit()
    ),  BlocProvider<LocationCubit>(
        create: (BuildContext context)=> LocationCubit()
    ),
  ];


}