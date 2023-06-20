part of 'TermsImports.dart';

class TermsData {

  String data="";
  void getTerms(BuildContext context){
    var termsData = context.read<SettingCubit>().state.model.terms;
    if(termsData !=null){
      data=termsData;
    }
  }

}
