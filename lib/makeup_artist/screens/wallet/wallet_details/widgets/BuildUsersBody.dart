part of 'WalletDetailsWidgetsImports.dart';

class BuildUsersBody extends StatelessWidget {
  WalletDetailsData walletDetailsData;

  BuildUsersBody({super.key, required this.walletDetailsData});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return buildUserItem(context, index);
        },
      ),
    );
  }

  Widget buildUserItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10,top: 5),
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
              const ClipOval(
                child: CachedImage(
                  url:
                  "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHNhbG9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10,),
              MyText(
                color: MyColors.black,
                size: 14,
                fontWeight: FontWeight.bold,
                title: "مريم جلال",
              ),
            ],
          ),
          MyText(
            color: MyColors.black,
            size: 14,
            fontWeight: FontWeight.bold,
            title: "1300 ر.س",
          ),
        ],
      ),
    );
  }
}
