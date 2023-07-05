part of 'AvailableTimesWidgetsImports.dart';

class BuildTimeBody extends StatelessWidget {
  AvailableTimesData availableTimesData;

  BuildTimeBody({super.key, required this.availableTimesData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "chooseTime"),
            color: MyColors.primary,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          // MediaQuery.removePadding(
          //   context: context,
          //   removeTop: true,
          //   child: SizedBox(
          //     height: 50,
          //     child: ListView.builder(
          //       itemCount: 2,
          //       scrollDirection: Axis.horizontal,
          //       shrinkWrap: true,
          //       itemBuilder: (BuildContext context, int index) {
          //         return buildTimeItem(context, index);
          //       },
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///FromController
              GestureDetector(
                onTap: () {
                  void setTime(BuildContext context) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    AdaptivePicker.timePicker(
                      context: context,
                      onConfirm: (date) {
                        // check if date was chosen
                        if (date != null) {
                          // set date format
                          String timeFormat =
                              DateFormat("HH:MM aa").format(date);
                          // update date cubit
                          // timeBloc.onUpdateData(timeFormat);
                          // // update variable
                          // selectedTime = date;
                          // chooseWorkerStepBloc.onUpdateData(3);
                          // getWorkers(context);
                        }
                      },
                      title: 'Choose time',
                    );
                  }
                },
                child: SizedBox(
                  width: 100,
                  child: TextField(
                    // readOnly: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyColors.primary, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyColors.primary, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyColors.primary, width: 1)),
                    ),
                    controller: availableTimesData.fromController,
                  ),
                ),
              ),

              ///ToController
              SizedBox(
                width: 100,
                child: TextField(
                  // readOnly: true,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.primary, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.primary, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.primary, width: 1)),
                  ),
                  controller: availableTimesData.toController,
                ),
              ),
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
