part of 'WelcomePageImports.dart';

class WelcomePageData {
  // blocs
  final GenericBloc<double> pagesCubit = GenericBloc(0);

  // variables
  List<Widget> data = [];

  void initPagesData(BuildContext context) {
    var pages = context.read<SettingCubit>().state.model.onboardPages;
    double circleNumber = 1 / pages!.length;
    if (pages != null) {
      pages.reversed;
      data = List.generate(
          pages.length,
          (index) => BuildPageView(
                numberCircle: circleNumber,
                key: Key("$index"),
                model: WelcomeEntity(
                    title: pages[index].title,
                    desc: pages[index].desc,
                    image: pages[index].image,
                    index: index,
                    last: index == pages.length - 1,
                    pageCubit: pagesCubit),
                welcomePageData: this,
              ));
      return;
    }

    data = [
      BuildPageView(
        key: const Key("1"),
        model: WelcomeEntity(
            title: "هيرستشن محطتك للجمال",
            desc: "يوضع هنا وصف الميزة والذي تكون عاده من عدة اسطر كهذا المثال",
            image: Res.onboarding,
            index: 0,
            pageCubit: pagesCubit),
        welcomePageData: this, numberCircle: 0.333,
      ),
      BuildPageView(
        key: const Key("2"),
        model: WelcomeEntity(
            title: "هيرستشن محطتك للجمال",
            desc: "يوضع هنا وصف الميزة والذي تكون عاده من عدة اسطر كهذا المثال",
            image: Res.onboarding,
            index: 1,
            pageCubit: pagesCubit),
        welcomePageData: this,
        numberCircle: 0.333,
      ),
      BuildPageView(
        key: const Key("3"),
        model: WelcomeEntity(
            title: "هيرستشن محطتك للجمال",
            desc: "يوضع هنا وصف الميزة والذي تكون عاده من عدة اسطر كهذا المثال",
            image: Res.onboarding,
            last: true,
            index: 2,
            pageCubit: pagesCubit),
        welcomePageData: this,
        numberCircle: 0.333,
      ),
    ];
  }
}
