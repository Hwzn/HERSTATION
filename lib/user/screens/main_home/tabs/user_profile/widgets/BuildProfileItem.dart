part of 'UserProfileWidgetsImports.dart';

class BuildProfileItem extends StatelessWidget {
  final UserProfileData userProfileData;
  final GeneralModel generalModel;
  final int index;

  const BuildProfileItem(
      {super.key,
      required this.userProfileData,
      required this.generalModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.bgPrimary,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Image.asset(
              generalModel.img!,
              width: 22,
              height: 22,
            ),
            const SizedBox(
              width: 10,
            ),
            MyText(
              title: tr(context, generalModel.title!),
              color: MyColors.primary,
              size: 14,
            ),
          ],
        ),
      ),
      onTap: () {
        userProfileData.moveToPage( tr(context, generalModel.title!), context);
      },
    );
  }
}
