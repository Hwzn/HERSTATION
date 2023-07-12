part of 'AvailableTimesDialogsImports.dart';

class BuildTimePickerDialog extends StatelessWidget {
  final BuildContext buildContext;
  final AvailableTimesData availableTimesData;
  final String type;

  const BuildTimePickerDialog(
      {Key? key,
      required this.buildContext,
      required this.availableTimesData,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    return Container(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: MyText(
                title: tr(context, type),
                color: MyColors.primary,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2),
              itemCount: availableTimesData.times!.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return buildItem(
                  availableTimesData.times![index],context
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(TimeModel time,BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: MyColors.bgPrimary),
        child: MyText(
          title: time.time??"",
          alien: TextAlign.center,
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
      ),
      onTap: () {
        if(type =="from"){
          availableTimesData.selectedFrom=time.hour!;
          availableTimesData.fromCubit.onUpdateData(time.time??"");
          Navigator.of(context).pop();
        }else{
          availableTimesData.selectedTo=time.hour!;
          availableTimesData.toCubit.onUpdateData(time.time??"");
          Navigator.of(context).pop();
        }
      },
    );
  }
}
