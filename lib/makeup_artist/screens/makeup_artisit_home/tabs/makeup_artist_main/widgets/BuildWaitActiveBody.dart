part of 'MakeupArtistWidgetsImports.dart';

class BuildWaitActiveBody extends StatelessWidget {

  const BuildWaitActiveBody({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: MyColors.bgPrimary),
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: 
        
        MyText(
          title: tr(context, "waitActive"),
          color: MyColors.primary,
          size: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
