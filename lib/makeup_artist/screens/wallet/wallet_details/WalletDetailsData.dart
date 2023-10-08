part of 'WalletDetailsImports.dart';

class WalletDetailsData {
  final PagingController<int, WalletModel> pagingController =
      PagingController(firstPageKey: 1);

  final int pageSize = 10;



  Future<void> getWalletRetainers(BuildContext context, int page) async {
    var walletRetainers =
    await MakeUpArtistRepository(context).getWalletRetainers();
    final isLastPage = walletRetainers.length < pageSize;
    if (page == 1) {
      pagingController.itemList = [];
    }
    if (isLastPage) {
      pagingController.appendLastPage(walletRetainers);
    } else {
      final nextPageKey = page + 1;
      pagingController.appendPage(walletRetainers, nextPageKey);
    }
  }

  Future<void> getWalletTotals(BuildContext context, int page) async {
    var walletTotals =
    await MakeUpArtistRepository(context).getWalletTotals();
    final isLastPage = walletTotals.length < pageSize;
    if (page == 1) {
      pagingController.itemList = [];
    }
    if (isLastPage) {
      pagingController.appendLastPage(walletTotals);
    } else {
      final nextPageKey = page + 1;
      pagingController.appendPage(walletTotals, nextPageKey);
    }

  }
}
