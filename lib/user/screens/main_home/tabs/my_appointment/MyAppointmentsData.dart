part of 'MyAppointmentsImports.dart';

class MyAppointmentsData {
  final GenericBloc<bool> isCurrentAppointmentCubit = GenericBloc(true);
  final GenericBloc<bool> showServicesCubit = GenericBloc(false);
  final GenericBloc<bool> isMakeupArtistCubit = GenericBloc(false);
  final GenericBloc<bool> showData = GenericBloc(false);

  final PagingController<int, OrderModel> pagingController =
      PagingController(firstPageKey: 1);

  final int pageSize = 15;

  void setCurrentAppointment(
    BuildContext context,
  ) {
    showData.onUpdateData(false);
    isCurrentAppointmentCubit.onUpdateData(true);
    getOrders(context, "current", 1);
    pagingController.addPageRequestListener((pageKey) {
      getOrders(context, "current", pageKey);
    });
  }

  void setPreviousAppointment(BuildContext context) {
    showData.onUpdateData(false);
    isCurrentAppointmentCubit.onUpdateData(false);
    getOrders(context, "previous", 1);
    pagingController.addPageRequestListener((pageKey) {
      getOrders(context, "previous", pageKey);
    });
  }

  void checkingTyp() async {
    int type = await Storage.getUserType() ?? 2;
    if (type == 3) {
      isMakeupArtistCubit.onUpdateData(true);
    }
  }

  void moveToDetails(
      BuildContext context, int index, OrderModel orderModel) async {
    int typeOrder = 0;
    if (!isCurrentAppointmentCubit.state.data) {
      typeOrder = 1;
    }
    int type = await Storage.getUserType() ?? 2;
    if (type == 2 && context.mounted) {
      AutoRouter.of(context).push(AppointmentDetailsRoute(
          index: index, orderModel: orderModel, typeOrder: typeOrder));
    } else {
      AutoRouter.of(context).push(MakeupArtistAppointmentDetailsRoute(
          index: index, orderModel: orderModel));
    }
  }

  Future<void> getOrders(BuildContext context, String type, int page) async {
    List<OrderModel> orders =
        await UserRepository(context).getOrders(page, type);
    showData.onUpdateData(true);
    final isLastPage = orders.length < pageSize;
    if (page == 1) {
      pagingController.itemList = [];
    }
    if (isLastPage) {
      pagingController.appendLastPage(orders);
    } else {
      final nextPageKey = page + 1;
      pagingController.appendPage(orders, nextPageKey);
    }

    // providersCubit.onUpdateData(providers);
  }
}
