part of 'WalletDetailsWidgetsImports.dart';

class BuildUsersBody extends StatelessWidget {
  WalletDetailsData walletDetailsData;

  BuildUsersBody({super.key, required this.walletDetailsData});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: PagedListView<int, WalletModel>(
        padding: const EdgeInsets.only(top: 8, bottom: 150, right: 5, left: 5),
        pagingController: walletDetailsData.pagingController,
        // shrinkWrap: true,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        builderDelegate: PagedChildBuilderDelegate<WalletModel>(
            noItemsFoundIndicatorBuilder: (context) => Container(),
            itemBuilder: (context, item, index) {
              return buildUserItem(context, index, item.user!,item.paidAmount.toString());
            },
            firstPageProgressIndicatorBuilder: (context) => Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: LoadingDialog.showLoadingView(),
                ),
            newPageProgressIndicatorBuilder: (context) =>
                const CupertinoActivityIndicator()),
      ),
      // child: ListView.builder(
      //   itemCount: 3,
      //   shrinkWrap: true,
      //   itemBuilder: (BuildContext context, int index) {
      //     return buildUserItem(context, index);
      //   },
      // ),
    );
  }

  Widget buildUserItem(BuildContext context, int index, User user,String paidAmount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      decoration: BoxDecoration(
        color: MyColors.bgPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               ClipOval(
                child: CachedImage(
                  url:user.image??"",
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              MyText(
                color: MyColors.black,
                size: 14,
                fontWeight: FontWeight.bold,
                title: user.name??"",
              ),
            ],
          ),
          MyText(
            color: MyColors.black,
            size: 14,
            fontWeight: FontWeight.bold,
            title: "$paidAmount${tr(context, "sr")}",
          ),
        ],
      ),
    );
  }
}
