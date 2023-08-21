part of 'RatesWidgetsImports.dart';

class BuildAllRatesBody extends StatelessWidget {
  final RatesData ratesData;

  const BuildAllRatesBody({super.key, required this.ratesData});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: PagedListView<int, RateModel>(
        padding: const EdgeInsets.only(top: 8, bottom: 10, right: 5, left: 5),
        pagingController: ratesData.pagingController,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        builderDelegate: PagedChildBuilderDelegate<RateModel>(
            noItemsFoundIndicatorBuilder: (context) =>
                 Container(),
            itemBuilder: (context, item, index) {
              return buildRateItem(context ,item);
            },
            noMoreItemsIndicatorBuilder: (context) => Container(),
            firstPageProgressIndicatorBuilder: (context) => Container(),
            newPageProgressIndicatorBuilder: (context) =>
                const CupertinoActivityIndicator()),
      ),
    );
  }

  Widget buildRateItem(BuildContext context, RateModel rateModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: MyColors.bgPrimary),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
           ClipOval(
            child: CachedImage(
              url:rateModel.authorImage??"",
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RatingBar.builder(
            initialRating: double.parse(rateModel.rate.toString()),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemSize: 18,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          MyText(
            title: rateModel.author??"",
            color: MyColors.black,
            size: 14,
          ),
          const SizedBox(
            height: 5,
          ),
          MyText(
            title:rateModel.comment??"",
            color: MyColors.grey,
            size: 13,
          ),
        ],
      ),
    );
  }
}
