part of 'login_widgets_imports.dart';

class BuildDontHaveAccount extends StatelessWidget {
  final LoginData loginData;

  const BuildDontHaveAccount({Key? key, required this.loginData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                title: tr(context, "don'tHaveAccount"),
                color: MyColors.white,
                size: 13,
              ),
              InkWell(
                onTap: () => AutoRouter.of(context).push(RegisterRoute()),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: MyText(
                    title: tr(context, "registerNow"),
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                    size: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: loginData.userTypeCubit,
            builder: (context, state) {
              print(state.data.toString());
              return Visibility(
                visible: state.data == 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: InkWell(
                    onTap: () => loginData.setType(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: MyText(
                        title: tr(context, "registerAsMakeupArtist"),
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                        size: 13,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
