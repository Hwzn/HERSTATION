part of  'SelectPlaceWidgetsImports.dart';

class BuildConfirmButton extends StatelessWidget {
  final SelectPlaceData selectPlaceData;

  const BuildConfirmButton({super.key, required this.selectPlaceData});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      height: 50,
      borderRadius: BorderRadius.circular(15),
      borderColor: MyColors.primary,
      title: tr(context, "saveChange"),
      onTap: () {
        selectPlaceData.updateCity(context);
      },
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      fontSize: 13,
    );
  }
}
