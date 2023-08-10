part of 'MyServicesWidgetsImports.dart';

class BuildMakeupCost extends StatelessWidget {
  MyServicesData servicesData;

  BuildMakeupCost({super.key, required this.servicesData});


  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 2) - 20;
    return Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: servicesData.brideMakeupCubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                              servicesData.brideMakeupCubit
                                  .onUpdateData(value!);
                            },
                          ),
                          MyText(
                              title: tr(context, "brideMakeup"),
                              color: MyColors.black,
                              alien: TextAlign.center,
                              size: 14),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: MyText(
                      title: tr(context, "cost"),
                      color: MyColors.black,
                      size: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width,
                      height: 60,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 90,
                            child: TextField(
                              controller:
                              servicesData.brideMakeUpCostController,
                              decoration: InputDecoration(
                                  hintText: tr(context, "enterCost"),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grey)),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          MyText(
                              title: tr(context,"sr"), color: MyColors.black, size: 13)
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: 60,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: servicesData
                                  .brideMakeUpDepositController,
                              decoration: InputDecoration(
                                  hintText: tr(context, "enterDeposit"),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grey)),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // filterSearchResults(value);
                              },
                            ),
                          ),
                          MyText(
                              title: tr(context,"sr"), color: MyColors.black, size: 13)
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: servicesData.sahraMakeupCubit,
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
                              servicesData.sahraMakeupCubit
                                  .onUpdateData(value!);
                            },
                          ),
                          MyText(
                              title: tr(context, "sahraMakeup"),
                              color: MyColors.black,
                              alien: TextAlign.center,
                              size: 14),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: MyText(
                      title: tr(context, "cost"),
                      color: MyColors.black,
                      size: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width,
                      height: 60,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller:
                              servicesData.sahraMakeUpCostController,
                              decoration: InputDecoration(
                                  hintText: tr(context, "enterCost"),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grey)),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // filterSearchResults(value);
                              },
                            ),
                          ),
                          MyText(
                              title: tr(context,"sr"), color: MyColors.black, size: 13)
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: 60,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: servicesData.sahraMakeUpDepositController,
                              decoration: InputDecoration(
                                  hintText: tr(context, "enterDeposit"),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grey)),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // filterSearchResults(value);
                              },
                            ),
                          ),
                          MyText(
                              title: tr(context,"sr"), color: MyColors.black, size: 13)
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: servicesData.bridemadesCubit,
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
                              servicesData.bridemadesCubit
                                  .onUpdateData(value!);
                            },
                          ),
                          MyText(
                              title: tr(context, "makeupBrideMades"),
                              color: MyColors.black,
                              alien: TextAlign.center,
                              size: 14),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: MyText(
                      title: tr(context, "cost"),
                      color: MyColors.black,
                      size: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width,
                      height: 60,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller:
                              servicesData.brideMatesCostController,
                              decoration: InputDecoration(
                                  hintText: tr(context, "enterCost"),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grey)),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // filterSearchResults(value);
                              },
                            ),
                          ),
                          MyText(
                              title: tr(context,"sr"), color: MyColors.black, size: 13)
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: 60,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextField(

                              controller:
                              servicesData.brideMatesDepositController,
                              decoration: InputDecoration(
                                  hintText: tr(context, "enterDeposit"),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grey)),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // filterSearchResults(value);
                              },

                            ),
                          ),
                          MyText(
                              title: tr(context,"sr"), color: MyColors.black, size: 13)
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
