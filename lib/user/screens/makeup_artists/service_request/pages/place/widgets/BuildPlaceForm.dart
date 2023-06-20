part of 'PlaceWidgetsImports.dart';

class BuildPlaceForm extends StatelessWidget {
  PlaceData placeData;

  BuildPlaceForm({super.key, required this.placeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 20, 5, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "addAddress"),
            color: MyColors.primary,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 15,
          ),
          Form(
            key: placeData.formAddress,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  child: DropdownTextField<RegionModel?>(
                    dropKey: placeData.areaDropKey,
                    hint: tr(context, "area"),
                    // selectedItem: placeData.selectedRegion,
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    validate: (value) {},
                    onChange: (RegionModel? model) =>
                        placeData.setRegion(model??RegionModel()),
                    // useName: true,
                    finData: (value) => placeData.getRegions(context),
                    enableColor: MyColors.white,
                    fillColor: MyColors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<GenericBloc<List<CityModel>>,
                        GenericState<List<CityModel>>>(
                    bloc: placeData.cityCubit,
                    builder: (context, state) {
                      return SizedBox(
                          height: 70,
                          child: DropdownTextField<CityModel?>(
                            dropKey: placeData.cityDropKey,
                            hint: tr(context, "city"),
                            // selectedItem: placeData.selectedCity,
                            margin: const EdgeInsets.only(top: 5, bottom: 15),
                            validate: (value) {},
                            onChange: (CityModel? model) =>
                                placeData.setCity(model ??CityModel()),
                            // useName: true,
                            // finData: (value) => placeData.getCities(context),
                            data: state.data,
                            enableColor: MyColors.white,
                            fillColor: MyColors.white,
                          ));
                    }),
                const SizedBox(
                  height: 10,
                ),
                GenericTextField(
                  fieldTypes: FieldTypes.rich,
                  max: 3,
                  fillColor: MyColors.white,
                  hint: tr(context, "address"),
                  controller: placeData.address,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  action: TextInputAction.done,
                  type: TextInputType.text,
                  validate: (value) =>value?.validateEmpty(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
