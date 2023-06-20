part of 'ContactUsImports.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final ContactUsData contactUsData = ContactUsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "contactUs"),
        haveLeading: true,
      ),
      backgroundColor: MyColors.bgPrimary,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              BuildContactUsInputs(contactUsData: contactUsData),
              LoadingButton(
                borderRadius: 8,
                borderColor: MyColors.primary,
                title: tr(context, "send"),
                onTap: () => contactUsData.addContactUs(context),
                color: MyColors.primary,
                textColor: MyColors.white,
                btnKey: contactUsData.btnKey,
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                fontSize: 13,
              ),
              const BuildContactSocial(),
            ],
          ),
        ),
      ),
    );
  }
}
