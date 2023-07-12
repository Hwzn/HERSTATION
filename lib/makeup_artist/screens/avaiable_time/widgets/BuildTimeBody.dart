part of 'AvailableTimesWidgetsImports.dart';

class BuildTimeBody extends StatelessWidget {
  AvailableTimesData availableTimesData;

  BuildTimeBody({super.key, required this.availableTimesData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<GenericBloc<String>, GenericState<String>>(
                  bloc: availableTimesData.fromCubit,
                  builder: (context, state) {
                    return InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        alignment: AlignmentDirectional.centerStart,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyColors.white),
                        child: MyText(
                          title: state.data.isEmpty
                              ? tr(context, "from")
                              : state.data,
                          color: MyColors.grey,
                          size: 13,
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return BuildTimePickerDialog(
                                buildContext: context,
                                availableTimesData: availableTimesData,
                                type: "from",
                              );
                            });
                      },
                    );
                  }),
              BlocBuilder<GenericBloc<String>, GenericState<String>>(
                  bloc: availableTimesData.toCubit,
                  builder: (context, state) {
                    return InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        alignment: AlignmentDirectional.centerStart,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyColors.white),
                        child: MyText(
                          title: state.data.isEmpty
                              ? tr(context, "to")
                              : state.data,
                          color: MyColors.grey,
                          size: 13,
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return BuildTimePickerDialog(
                                buildContext: context,
                                availableTimesData: availableTimesData,
                                type: "to",
                              );
                            });
                      },
                    );
                  }),
              // ///FromController
              // GestureDetector(
              //   onTap: () {
              //     void setTime(BuildContext context) {
              //       FocusScope.of(context).requestFocus(FocusNode());
              //       AdaptivePicker.timePicker(
              //         context: context,
              //         onConfirm: (date) {
              //           // check if date was chosen
              //           if (date != null) {
              //             // set date format
              //             String timeFormat =
              //                 DateFormat("HH:MM aa").format(date);
              //             // update date cubit
              //             // timeBloc.onUpdateData(timeFormat);
              //             // // update variable
              //             // selectedTime = date;
              //             // chooseWorkerStepBloc.onUpdateData(3);
              //             // getWorkers(context);
              //           }
              //         },
              //         title: 'Choose time',
              //       );
              //     }
              //   },
              //   child: SizedBox(
              //     width: 100,
              //     child: TextField(
              //       // readOnly: true,
              //       keyboardType: TextInputType.number,
              //       decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: MyColors.primary, width: 1)),
              //         focusedBorder: OutlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: MyColors.primary, width: 1)),
              //         enabledBorder: OutlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: MyColors.primary, width: 1)),
              //       ),
              //       controller: availableTimesData.fromController,
              //     ),
              //   ),
              // ),
              //
              // ///ToController
              // SizedBox(
              //   width: 100,
              //   child: TextField(
              //     // readOnly: true,
              //     keyboardType: TextInputType.number,
              //
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderSide:
              //               BorderSide(color: MyColors.primary, width: 1)),
              //       focusedBorder: OutlineInputBorder(
              //           borderSide:
              //               BorderSide(color: MyColors.primary, width: 1)),
              //       enabledBorder: OutlineInputBorder(
              //           borderSide:
              //               BorderSide(color: MyColors.primary, width: 1)),
              //     ),
              //     controller: availableTimesData.toController,
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTimeItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.bgPrimary, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      width: 100,
      height: 50,
      alignment: Alignment.center,
      child: MyText(
        title: "ص 1",
        color: MyColors.black,
        size: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
