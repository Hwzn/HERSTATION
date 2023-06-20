part of 'ServicesWidgetsImports.dart';

class BuildBrideServicesBody extends StatelessWidget {
  final ServicesData servicesData;

  const BuildBrideServicesBody({super.key, required this.servicesData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: MyColors.primary),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: tr(context,"brideMakeup"),
                color: MyColors.white,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                title: "700 ر.س",
                color: MyColors.white,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: servicesData.addAttachmentsCubit,
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 35,
                    child: Transform.translate(
                        offset: const Offset(8, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: state.data,
                              activeColor: MyColors.primary,
                              checkColor: Colors.white,
                              onChanged: (bool? value) {
                                servicesData.addAttachmentsCubit
                                    .onUpdateData(value!);
                              },
                            ),
                            MyText(
                                title: tr(context, "addAttachments"),
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                                alien: TextAlign.center,
                                size: 14),
                          ],
                        )
                        ),
                  ),
                  Visibility(
                    visible: state.data,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: (Column(
                        children: [
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                            child: MyText(
                              title: tr(context, "attachmentsNumber"),
                              color: MyColors.black,
                              size: 14,
                            ),
                          ),
                          Form(
                            key: servicesData.formSahraKey,
                            child: GenericTextField(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              controller: servicesData.customersNumber,
                              fieldTypes: FieldTypes.normal,
                              type: TextInputType.number,
                              action: TextInputAction.done,
                              fillColor: MyColors.white,
                              hint: tr(context, "attachmentsNumber"),
                              validate: (String? value) {},
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              );
            }),
        BuildBrideCostBody(servicesData: servicesData,),
      ],
    );
  }
}
