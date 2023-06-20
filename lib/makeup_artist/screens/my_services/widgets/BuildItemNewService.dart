part of 'MyServicesWidgetsImports.dart';

class BuildItemNewService extends StatelessWidget {
  MyServicesData servicesData;
  int index;

  BuildItemNewService(
      {super.key, required this.servicesData, required this.index});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 2) - 30;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: MyText(
                title: tr(context, "service"), color: MyColors.black, size: 14),
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, "enterService"),
            fillColor: Colors.white,
            controller: servicesData.otherControllerName[index],
            action: TextInputAction.next,
            type: TextInputType.text,
            margin: const EdgeInsets.symmetric(vertical: 10),
            validate: (value) => value!.validateEmpty(context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: MyText(
                title: tr(context, "cost"), color: MyColors.black, size: 14),
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
                      width: 80,
                      child: TextField(
                        controller: servicesData.otherControllerPrice[index],
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
                    MyText(title: "ر.س", color: MyColors.black, size: 13)
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
                      width: 80,
                      child: TextField(
                        controller: servicesData.otherControllerRetainer[index],
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
                    MyText(title: "ر.س", color: MyColors.black, size: 13)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
