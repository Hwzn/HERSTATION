part of 'MyServicesWidgetsImports.dart';

class BuildListNewService extends StatelessWidget {
  MyServicesData servicesData;

  BuildListNewService({super.key, required this.servicesData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: servicesData.listSizeCubit,
        builder: (context, state) {
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: state.data,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                servicesData.otherControllerName.add(TextEditingController());
                servicesData.otherControllerPrice.add(TextEditingController());
                servicesData.otherControllerRetainer
                    .add(TextEditingController());

                return BuildItemNewService(
                  index: index,
                  servicesData: servicesData,
                );
              },
            ),
          );
        });
  }
}
