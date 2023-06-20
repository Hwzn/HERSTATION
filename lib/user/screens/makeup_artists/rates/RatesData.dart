part of 'RatesImports.dart';

class RatesData {

  final GenericBloc<RatesModel?> ratesCubit = GenericBloc(null);
  final PagingController<int, RateModel> pagingController =
  PagingController(firstPageKey: 1);

  final int pageSize = 15;


  void fetchData(BuildContext context,int id, int page) async {
    RatesModel? ratesData =
    await UserRepository(context).getRates(id,page);
    List<RateModel>? listRates=ratesData.rates!;
    final isLastPage = listRates.length < pageSize;
    if (page == 1) {
      pagingController.itemList = [];
    }
    if (isLastPage) {
      pagingController.appendLastPage(listRates);
    } else {
      final nextPageKey = page + 1;
      pagingController.appendPage(listRates, nextPageKey);
    }

    ratesCubit.onUpdateData(ratesData);
  }

}
