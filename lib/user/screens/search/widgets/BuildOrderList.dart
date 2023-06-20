part of 'SearchWidgetsImports.dart';

class BuildOrderList extends StatelessWidget {
  final SearchData searchData;

  const BuildOrderList({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: searchData.orderCubit,
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: Transform.translate(
                      offset: const Offset(20, 0),
                      child: CheckboxListTile(
                        title: Text(
                          tr(context, "moreRated"),
                          style: TextStyle(fontSize: 13, color: MyColors.black),
                        ),
                        autofocus: false,
                        activeColor: MyColors.primary,
                        checkColor: Colors.white,
                        selected: state.data == 0,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: state.data == 0,
                        onChanged: (bool? value) {
                          // searchData.highestRatedCubit.onUpdateData(value!);
                          searchData.orderCubit.onUpdateData(0);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Transform.translate(
                      offset: const Offset(20, 0),
                      child: CheckboxListTile(
                        title: Text(
                          tr(context, "leastRated"),
                          style: TextStyle(fontSize: 13, color: MyColors.black),
                        ),
                        autofocus: false,
                        activeColor: MyColors.primary,
                        checkColor: Colors.white,
                        selected: state.data == 1,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: state.data == 1,
                        onChanged: (bool? value) {
                          // searchData.leastRatedCubit.onUpdateData(value!);
                          searchData.orderCubit.onUpdateData(1);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Transform.translate(
                      offset: const Offset(20, 0),
                      child: CheckboxListTile(
                        title: Text(
                          tr(context, "highestPrice"),
                          style: TextStyle(fontSize: 13, color: MyColors.black),
                        ),
                        autofocus: false,
                        activeColor: MyColors.primary,
                        checkColor: Colors.white,
                        selected: state.data == 2,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: state.data == 2,
                        onChanged: (bool? value) {
                          // searchData.highestPriceCubit.onUpdateData(value!);
                          searchData.orderCubit.onUpdateData(2);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Transform.translate(
                      offset: const Offset(20, 0),
                      child: CheckboxListTile(
                        title: Text(
                          tr(context, "leastPrice"),
                          style: TextStyle(fontSize: 13, color: MyColors.black),
                        ),
                        autofocus: false,
                        activeColor: MyColors.primary,
                        checkColor: Colors.white,
                        selected: state.data == 3,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: state.data == 3,
                        onChanged: (bool? value) {
                          // searchData.leastPriceCubit.onUpdateData(value!);
                          searchData.orderCubit.onUpdateData(3);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
