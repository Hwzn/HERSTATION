part of 'WelcomePageImports.dart';

class WelcomePageData {
  // blocs
  final GenericBloc<double> pagesCubit = GenericBloc(0);

  // variables
  List<Widget> data = [];

  void initPagesData(BuildContext context) {
    var pages = context.read<SettingCubit>().state.model.onboardPages;
    // if(pages!=null){
    //   pages.reversed;
    //   data = List.generate(pages.length, (index) => BuildPageView(
    //   key:  Key("$index"),
    //   model: WelcomeEntity(
    //       title: pages[index].title,
    //       desc:pages[index].desc,
    //       image: index == 0 ? Res.onboardingOne:index==1?Res.onboardingTwo:Res.onboardingThree,
    //       index: index,
    //       last: index == pages.length-1,
    //       pageCubit: pagesCubit),
    // ));
    //   return;
    // }

    data = [
      BuildPageView(
        key: const Key("1"),
        model: WelcomeEntity(
            title: "هيرستشن محطتك للجمال",
            desc:
                "يوضع هنا وصف الميزة والذي تكون عاده من عدة اسطر كهذا المثال",
            image: Res.onboarding,
            index: 0,
            pageCubit: pagesCubit),
        welcomePageData: this,
      ),
      BuildPageView(
        key: const Key("2"),
        model: WelcomeEntity(
            title: "هيرستشن محطتك للجمال",
            desc:
            "يوضع هنا وصف الميزة والذي تكون عاده من عدة اسطر كهذا المثال",
            image: Res.onboarding,
            index: 1,
            pageCubit: pagesCubit),
        welcomePageData: this,
      ),
      BuildPageView(
        key: const Key("3"),
        model: WelcomeEntity(
            title: "هيرستشن محطتك للجمال",
            desc:
            "يوضع هنا وصف الميزة والذي تكون عاده من عدة اسطر كهذا المثال",
            image: Res.onboarding,
            last: true,
            index: 2,
            pageCubit: pagesCubit),
        welcomePageData: this,
      ),
    ];

  }
}
