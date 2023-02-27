part of 'SearchWidgetsImports.dart';

class BuildOrderList extends StatelessWidget {
  final SearchData searchData;

  const BuildOrderList({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: searchData.highestRatedCubit,
            builder: (context, state) {
              return SizedBox(
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
                    selected: state.data,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: state.data,
                    onChanged: (bool? value) {
                      searchData.highestRatedCubit.onUpdateData(value!);
                    },
                  ),
                ),
              );
            }), //CheckboxListTile
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: searchData.leastRatedCubit,
            builder: (context, state) {
              return SizedBox(
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
                    selected: state.data,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: state.data,
                    onChanged: (bool? value) {
                      searchData.leastRatedCubit.onUpdateData(value!);
                    },
                  ),
                ),
              );
            }), //CheckboxListTile
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: searchData.highestPriceCubit,
            builder: (context, state) {
              return SizedBox(
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
                    selected: state.data,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: state.data,
                    onChanged: (bool? value) {
                      searchData.highestPriceCubit.onUpdateData(value!);
                    },
                  ),
                ),
              );
            }), //CheckboxListTile
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: searchData.leastPriceCubit,
            builder: (context, state) {
              return SizedBox(
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
                    selected: state.data,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: state.data,
                    onChanged: (bool? value) {
                      searchData.leastPriceCubit.onUpdateData(value!);
                    },
                  ),
                ),
              );
            }), //CheckboxListTile
      ],
    );
  }
}
