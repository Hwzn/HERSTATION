part of 'ContactUsWidgetsImports.dart';

class BuildContactSocial extends StatelessWidget {
  const BuildContactSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            MyText(
              title: "او تواصل معانا",
              color: MyColors.black,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset(
            //         Res.whatsapp,
            //         width: 40,
            //         height: 40,
            //       ),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       SvgPicture.asset(
            //         Res.facebook,
            //         width: 40,
            //         height: 40,
            //       ),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       SvgPicture.asset(
            //         Res.insta,
            //         width: 40,
            //         height: 40,
            //       ),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       SvgPicture.asset(
            //         Res.twitter,
            //         width: 40,
            //         height: 40,
            //       ),
            //     ],
            //   ),
            // ),
            BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      state.model.socials!.length,
                      (index) => InkWell(
                        onTap: () {
                          HelperMethods.launchURL(
                              url: state.model.socials?[index].link ?? '');
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Image.network(
                            state.model.socials?[index].image ?? '',
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
