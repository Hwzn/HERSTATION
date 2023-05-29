part of 'TermsImports.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  TermsData termsData = TermsData();

  @override
  void initState() {
    termsData.getTerms(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var terms = context.read<SettingCubit>().state.model.terms;
    return Scaffold(
        appBar: DefaultAppBar(
          title: tr(context, "terms"),
          haveLeading: true,
        ),
        backgroundColor: MyColors.bgPrimary,
        body: BuildTermsView(text: termsData.data ?? ""));
  }
}
