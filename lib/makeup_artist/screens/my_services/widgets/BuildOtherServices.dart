part of 'MyServicesWidgetsImports.dart';

class BuildOtherServices extends StatelessWidget {
  MyServicesData servicesData;

  BuildOtherServices({super.key, required this.servicesData});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 2) - 30;
    return Container(
        child: Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: servicesData.otherCubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 35,
                  child: Transform.translate(
                      offset: const Offset(15, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: state.data,
                            activeColor: MyColors.primary,
                            checkColor: Colors.white,
                            onChanged: (bool? value) {
                              servicesData.otherCubit
                                  .onUpdateData(value!);
                            },
                          ),
                          MyText(
                              title:tr(context,"otherServices"),
                              color: MyColors.black,
                              alien: TextAlign.center,
                              size: 14),
                        ],
                      )),
                ),
              ],
            );
          },
        ),
        // BuildItemNewService(
        //   servicesData: servicesData,
        // ),
        // BuildItemNewService(
        //   servicesData: servicesData,
        // ),
        BuildListNewService(servicesData: servicesData),
        InkWell(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                SvgPicture.asset(Res.plus),
                const SizedBox(
                  width: 10,
                ),
                MyText(
                    title: tr(context, "addExtra"),
                    color: MyColors.black,
                    fontWeight: FontWeight.bold,
                    alien: TextAlign.center,
                    size: 14),
              ],
            ),
          ),
          onTap: ()=> servicesData.changeSizeList(),
        ),
      ],
    ));
  }
}
