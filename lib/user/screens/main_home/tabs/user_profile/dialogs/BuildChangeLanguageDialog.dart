part of 'UserProfileDialogsImports.dart';

class BuildChangeLanguageDialog extends StatelessWidget {
  final BuildContext buildContext;
  final UserProfileData userProfileData;

  const BuildChangeLanguageDialog(
      {Key? key, required this.buildContext, required this.userProfileData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: MyText(
              title: tr(context, "changeLang"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: userProfileData.isArabicLangCubit,
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: state.data ?MyColors.primary:Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: width,
                        alignment: AlignmentDirectional.center,
                        child: MyText(
                          title: tr(context, "langAr"),
                          color:state.data? MyColors.white:MyColors.grey,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () =>
                          userProfileData.changeLanguage(context, "ar"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color:state.data?Colors.transparent: MyColors.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: width,
                        alignment: AlignmentDirectional.center,
                        child: MyText(
                          title: tr(context, "langEn"),
                          color:state.data?MyColors.grey: MyColors.white,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () =>
                          userProfileData.changeLanguage(context, "en"),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
