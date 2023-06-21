part of 'MyWalletWidgetsImports.dart';

class BuildTotalDepositsBody extends StatelessWidget {
  MyWalletData? myWalletData;
  WalletDataModel? walletDataModel;

  BuildTotalDepositsBody({super.key, this.myWalletData, this.walletDataModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: tr(context, "totalDeposit"),
                color: MyColors.primary,
                size: 13,
                fontWeight: FontWeight.bold,
              ),
              InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: MyText(
                      title: tr(context, "allDetails"),
                      color: MyColors.primary,
                      size: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => AutoRouter.of(context).push(
                      WalletDetailsRoute(title: tr(context, "totalDeposit")))),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: MyColors.bgPrimary,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: MyText(
              color: MyColors.primary,
              size: 16,
              fontWeight: FontWeight.bold,
              title: '${walletDataModel?.retainers ?? 0}', //"1300 ر.س",
            ),
          ),
        ],
      ),
    );
  }
}
