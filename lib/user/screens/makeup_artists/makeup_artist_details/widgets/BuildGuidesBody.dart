part of 'MakeupArtistDetailsWidgetsImports.dart';

class BuildGuidesBody extends StatelessWidget {
  final MakeupArtistDetailsData makeupArtistDetailsData;
  final String text;

  const BuildGuidesBody(
      {super.key, required this.makeupArtistDetailsData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: text.isNotEmpty,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: tr(context, "guides"),
          color: MyColors.primary,
          size: 16,
          fontWeight: FontWeight.bold,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MyColors.bgPrimary),
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(title: text, color: MyColors.black, size: 14),
            ],
          ),
        )
      ],
    ));
  }
}
