part of 'TermsImports.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> with TermsData {
  @override
  Widget build(BuildContext context) {
    // var terms = context.read<SettingCubit>().state.model.terms;
    return Scaffold(
        appBar: DefaultAppBar(
          title: tr(context, "terms"),
          haveLeading: true,
        ),
        backgroundColor: MyColors.bgPrimary,
        body: const BuildTermsView(
            text:
                "توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. توضع هنا الشروط والاحكام والتي عادة ما تتكون من عدة اسطر. "));
  }
}
