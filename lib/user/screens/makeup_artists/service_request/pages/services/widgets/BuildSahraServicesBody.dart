part of 'ServicesWidgetsImports.dart';

class BuildSahraServicesBody extends StatelessWidget {
  final ServicesData servicesData;

  const BuildSahraServicesBody({super.key, required this.servicesData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: MyColors.primary),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: tr(context,"sahraMakeup"),
                color: MyColors.white,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                title: "400 ر.س",
                color: MyColors.white,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
          child: MyText(
            title: tr(context, "customersNumbers"),
            color: MyColors.black,
            size: 14,
          ),
        ),
        Form(
          key: servicesData.formSahraKey,
          child: GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            controller: servicesData.customersNumber,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.done,
            fillColor: MyColors.white,
            hint: tr(context, "customersNumbers"),
            validate: (String? value) {},
          ),
        ),

      ],
    );
  }
}
