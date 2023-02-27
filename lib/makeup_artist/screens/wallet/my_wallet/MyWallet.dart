part of 'MyWalletImports.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  State<MyWallet> createState() => _MyWallet();
}

class _MyWallet extends State<MyWallet> {
  MyWalletData walletData = MyWalletData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "myWallet"),
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            BuildTotalDepositsBody(
              myWalletData: walletData,
            ),
            BuildTotalAmountServicesBody(
              myWalletData: walletData,
            ),
          ],
        ),
      ),
    );
  }
}
