part of 'MakeupArtistHomeWidgetsImports.dart';

class BuildTabItem extends StatelessWidget {
  final int index;
  final bool isActive;
  final MakeupArtistHomeData makeupArtistHomeData;

  const BuildTabItem(
      {super.key,
      required this.index,
      required this.isActive,
      required this.makeupArtistHomeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isActive
                ? makeupArtistHomeData.listHome.elementAt(index).activeImg!
                : makeupArtistHomeData.listHome.elementAt(index).unactiveImg!,
            width: 15,
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: MyText(
                title: tr(context,makeupArtistHomeData.listHome.elementAt(index).title!),
                color: isActive ? MyColors.primary : MyColors.secondary,
                size: 11),
          ),
          Container(
            width: 20,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isActive ? MyColors.primary : MyColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
