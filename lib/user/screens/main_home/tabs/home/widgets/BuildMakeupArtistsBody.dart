part of 'HomeWidgetsImports.dart';

class BuildMakeupArtistsBody extends StatelessWidget {
  final HomeData homeData;

  const BuildMakeupArtistsBody({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: MyText(
              title: tr(context, "makeupArtists"),
              color: MyColors.primary,
              size: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildMakeupArtistItem(index, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMakeupArtistItem(int index, BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 180,
        width: 150,
        child: Card(
          color: MyColors.bgPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
              top: Radius.circular(10),
            ),
          ),
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ClipOval(
                  child: CachedImage(
                    url:
                        "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHNhbG9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                MyText(
                  title: "مايان عمران",
                  size: 14,
                  fontWeight: FontWeight.bold,
                  color: MyColors.black,
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () => AutoRouter.of(context).push(const MakeupArtistDetailsRoute()),
    );
  }
}
