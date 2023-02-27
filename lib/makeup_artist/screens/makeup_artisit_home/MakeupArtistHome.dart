part of 'MakeupArtistHomeImports.dart';

class MakeupArtistHome extends StatefulWidget {
  const MakeupArtistHome({Key? key}) : super(key: key);

  @override
  State<MakeupArtistHome> createState() => _MakeupArtistHome();
}

class _MakeupArtistHome extends State<MakeupArtistHome> {
  MakeupArtistHomeData makeupArtistHomeData = MakeupArtistHomeData();

  @override
  void initState() {
    makeupArtistHomeData.initData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BuildHeaderMainHome(
            makeupArtistHomeData: makeupArtistHomeData,
          ),
          Expanded(
            child: BuildTabPages(
              makeupArtistHomeData: makeupArtistHomeData,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BuildTabBody(
        makeupArtistHomeData: makeupArtistHomeData,
      ),
    );
  }
}
