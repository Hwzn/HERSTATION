part of 'MyWalletImports.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  State<MyWallet> createState() => _MyWallet();
}

class _MyWallet extends State<MyWallet> {
  MyWalletData walletData = MyWalletData();

  @override
  void initState() {
    walletData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "myWallet"),
        haveLeading: true,
      ),
      body: BlocBuilder<GenericBloc<WalletDataModel?>,
          GenericState<WalletDataModel?>>(
        bloc: walletData.walletBloc,
        builder: (context, state) {
          if(state is GenericUpdateState){
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                BuildTotalDepositsBody(
                  // myWalletData: walletData,
                  walletDataModel: state.data,
                ),
                BuildTotalAmountServicesBody(
                  //myWalletData: walletData,
                  walletDataModel: state.data,
                ),
              ],
            ),
          );}else{
            return Container(
              margin: const EdgeInsets.only(top: 80),
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
