part of 'AppointmentDetailsWidgetsImports.dart';

class BuildServicesBody extends StatelessWidget {
  final AppointmentDetailsData appointmentDetailsData;

  const BuildServicesBody({super.key, required this.appointmentDetailsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildServicesItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServicesItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ClipOval(
                child: CachedImage(
                  url:
                      "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHNhbG9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              MyText(title: "ميك اب عروس", color: MyColors.black, size: 13),
            ],
          ),
          MyText(title: "1x  ر.س 70", color: MyColors.black, size: 13),
        ],
      ),
    );
  }
}
