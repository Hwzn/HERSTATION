part of 'PaymentWidgetsImports.dart';

class BuildDetailsPaymentBody extends StatelessWidget {
  PaymentData paymentData;

  BuildDetailsPaymentBody({super.key, required this.paymentData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "services"),
            color: MyColors.primary,
            size: 16,
            fontWeight: FontWeight.bold,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyColors.bgPrimary),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child:   Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: "ميك اب عروس",
                        color: MyColors.black,
                        size: 13,
                      ),
                      MyText(
                        title: "x1 70 ر.س",
                        color: MyColors.black,
                        size: 13,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: "ميك اب مرافقات",
                        color: MyColors.black,
                        size: 13,
                      ),
                      MyText(
                        title: "x3 40 ر.س",
                        color: MyColors.black,
                        size: 13,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: "المجموع الكلي",
                        color: MyColors.black,
                        size: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      MyText(
                        title: "400 ر.س",
                        color: MyColors.black,
                        size: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )
                ],
              )),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColors.bgPrimary),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: "العربون ( يدفع قبل ميعاد الحجز )",
                  color: MyColors.black,
                  size: 13,
                ),
                MyText(
                  title: "100 ر.س",
                  color: MyColors.black,
                  size: 13,
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
