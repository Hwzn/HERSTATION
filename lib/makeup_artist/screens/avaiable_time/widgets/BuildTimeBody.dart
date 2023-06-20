part of 'AvailableTimesWidgetsImports.dart';

class BuildTimeBody extends StatefulWidget {
  AvailableTimesData availableTimesData;

  BuildTimeBody({super.key, required this.availableTimesData});

  @override
  State<BuildTimeBody> createState() => _BuildTimeBodyState();
}

class _BuildTimeBodyState extends State<BuildTimeBody> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  DateTime? myTime;
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
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.primary, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.primary, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.primary, width: 1)),
                hintText: fromController.text),
            readOnly: true,
            controller: fromController,
            onTap: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomHourPicker(
                    elevation: 2,
                    onPositivePressed: (context, time) {
                      setState(() {
                        fromController.text = time.toString();
                      });
                      // if (time != null) {
                      //   fromController.text = time.toString();
                      // }
                      Navigator.pop(context);
                      print('onPositive');
                    },
                    onNegativePressed: (context) {
                      Navigator.pop(context);
                      print('onNegative');
                    },
                  );

                  //buildCustomTimer(context);
                },
              );
            },
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

// buildCustomTimer(BuildContext context) {
//   return CustomHourPicker(
//     elevation: 2,
//     onPositivePressed: (context, time) {
//       Text('$time');
//       Navigator.pop(context);
//       print('onPositive');
//     },
//     onNegativePressed: (context) {
//       Navigator.pop(context);
//       print('onNegative');
//     },
//   );
// }
