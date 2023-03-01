part of 'MainHomeWidgetsImports.dart';

class BuildTabItem extends StatelessWidget {
  final int index;
  final bool isActive;
  final MainHomeData mainHomeData;

  const BuildTabItem(
      {super.key,
      required this.index,
      required this.isActive,
      required this.mainHomeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isActive
                ? mainHomeData.listHome.elementAt(index).activeImg!
                : mainHomeData.listHome.elementAt(index).unactiveImg!,
            width: 15,
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: MyText(
                title:tr(context,mainHomeData.listHome.elementAt(index).title!),
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
