part of 'WalletDetailsImports.dart';

class WalletDetails extends StatefulWidget {
  String title;

  WalletDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<WalletDetails> createState() => _WalletDetails(title);
}

class _WalletDetails extends State<WalletDetails> {
  String title;

  _WalletDetails(this.title);

  WalletDetailsData walletDetailsData = WalletDetailsData();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (title == tr(context, "totalServices")) {
        walletDetailsData.getWalletTotals(context, 1);
        walletDetailsData.pagingController.addPageRequestListener((pageKey) {
          walletDetailsData.getWalletTotals(context, pageKey);
        });
      } else {
        walletDetailsData.getWalletRetainers(context, 1);

        walletDetailsData.pagingController.addPageRequestListener((pageKey) {
          walletDetailsData.getWalletRetainers(context, pageKey);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    walletDetailsData.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: title,
        haveLeading: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: title,
              color: MyColors.primary,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: BuildUsersBody(
                walletDetailsData: walletDetailsData,
              ),
            )
          ],
        ),
      ),
    );
  }
}
