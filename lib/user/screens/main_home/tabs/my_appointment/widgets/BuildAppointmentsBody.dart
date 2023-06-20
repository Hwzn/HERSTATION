part of 'MyAppointmentsWidgetsImports.dart';

class BuildAppointmentBody extends StatelessWidget {
  final MyAppointmentsData myAppointmentsData;

  const BuildAppointmentBody({super.key, required this.myAppointmentsData});

  @override
  Widget build(BuildContext context) {

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: myAppointmentsData.showData,
          builder: (context, state) {
            if (state.data) {
              return PagedListView<int, OrderModel>(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 150, right: 5, left: 5),
                pagingController: myAppointmentsData.pagingController,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                builderDelegate: PagedChildBuilderDelegate<OrderModel>(
                    noItemsFoundIndicatorBuilder: (context) => Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: MyText(
                            title: "لا يوجد حجوازات",
                            color: MyColors.black,
                            size: 16,
                            alien: TextAlign.center,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    itemBuilder: (context, item, index) {
                      return BuildAppointmentItem(
                        buildContext: context,
                        index: index,
                        myAppointments: myAppointmentsData,
                        orderModel: item,
                      );
                    },
                    noMoreItemsIndicatorBuilder: (context) => Container(),
                    firstPageProgressIndicatorBuilder: (context) =>
                        LoadingDialog.showLoadingView(),
                    newPageProgressIndicatorBuilder: (context) =>
                        const CupertinoActivityIndicator()),
              );
            } else {
              return LoadingDialog.showLoadingView();
            }
          }),
    );
  }
}
