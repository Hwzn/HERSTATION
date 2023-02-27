part of 'RegisterWidgetsImports.dart';

class BuildHaveAccount extends StatelessWidget {
  final RegisterDate registerDate;
  const BuildHaveAccount({Key? key,required this.registerDate}) : super(key: key);

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
                title: tr(context, "haveAccount"),
                color: MyColors.white,
                size: 13,
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () => AutoRouter.of(context).push(const LoginRoute()),
                child: MyText(
                  title: tr(context, "signIn"),
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                  size: 13,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: registerDate.userTypeCubit,
            builder: (context, state) {
              print(state.data.toString());
              return Visibility(
                visible: state.data == 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: InkWell(
                    onTap: () => registerDate.setType(),
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
