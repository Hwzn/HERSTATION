part of 'MyWalletImports.dart';

class MyWalletData {
  final GenericBloc<WalletDataModel?> walletBloc = GenericBloc(null);
  // methods
  fetchData(BuildContext context) async {
    var data = await MakeUpArtistRepository(context).getWalletData();
    walletBloc.onUpdateData(data);
    return data;
  }
}
