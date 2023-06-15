part of 'MakeupArtistDetailsImports.dart';

class MakeupArtistDetails extends StatefulWidget {
  final int id;

  const MakeupArtistDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<MakeupArtistDetails> createState() => _MakeupArtistDetails();
}

class _MakeupArtistDetails extends State<MakeupArtistDetails> {
  MakeupArtistDetailsData makeupArtistDetailsData = MakeupArtistDetailsData();

  @override
  void initState() {
    makeupArtistDetailsData.getProviderData(context, widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyWhite,
      body: Column(
        children: [
          BlocBuilder<GenericBloc<ProviderDetailsModel?>,
                  GenericState<ProviderDetailsModel?>>(
              bloc: makeupArtistDetailsData.providerCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  return BuildAppBarBody(
                      makeupArtistDetailsData: makeupArtistDetailsData,providerDetailsModel: state.data!,);
                } else {
                  return Container();
                }
              }),
          Expanded(
              child: SingleChildScrollView(
            child: BlocBuilder<GenericBloc<ProviderDetailsModel?>,
                    GenericState<ProviderDetailsModel?>>(
                bloc: makeupArtistDetailsData.providerCubit,
                builder: (context, state) {
                  if (state is GenericUpdateState) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildServicesBody(
                                  makeupArtistDetailsData:
                                      makeupArtistDetailsData),
                              BuildGuidesBody(
                                  makeupArtistDetailsData:
                                      makeupArtistDetailsData,text: state.data!.instructions??"",),
                              BuildRateBody(
                                makeupArtistDetailsData:
                                    makeupArtistDetailsData,
                                list: state.data!.rates??[],
                              ),
                            ],
                          ),
                        ),
                        LoadingButton(
                          borderRadius: 15,
                          borderColor: MyColors.primary,
                          title: tr(context, "confirmRequest"),
                          onTap: () =>
                              makeupArtistDetailsData.confirmRequest(context),
                          color: MyColors.primary,
                          textColor: MyColors.white,
                          btnKey: makeupArtistDetailsData.btnConfirmRequest,
                          fontSize: 13,
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: LoadingDialog.showLoadingView(),
                    );
                  }
                }),
          ))
        ],
      ),
    );
  }
}
