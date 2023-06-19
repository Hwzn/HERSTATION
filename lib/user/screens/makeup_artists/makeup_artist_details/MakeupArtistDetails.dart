part of 'MakeupArtistDetailsImports.dart';

class MakeupArtistDetails extends StatefulWidget {
  final int id;
  final int categoryID;

  const MakeupArtistDetails({Key? key, required this.id,required this.categoryID}) : super(key: key);

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
                  if (state.data!.gallery!.isNotEmpty) {
                    return BuildAppBarBody(
                      makeupArtistDetailsData: makeupArtistDetailsData,
                      providerDetailsModel: state.data!,
                      id: widget.id,
                    );
                  } else {
                    return Column(
                      children: [
                        DefaultAppBar(
                          title: state.data!.name ?? "",
                          haveLeading: true,
                          actions: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: InkWell(
                                child: Icon(
                                  state.data!.isFavorite!
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: MyColors.primary,
                                  size: 20,
                                ),
                                onTap: () => makeupArtistDetailsData
                                    .addRemoveFavourite(context, widget.id),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }
                } else {
                  return Column(
                    children: const [
                      DefaultAppBar(
                        title: "",
                        haveLeading: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }
              }),
          Expanded(
              child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
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
                                      makeupArtistDetailsData,
                                  listServices: state.data!.services ?? []),
                              BuildGuidesBody(
                                makeupArtistDetailsData:
                                    makeupArtistDetailsData,
                                text: state.data!.instructions ?? "",
                              ),
                              BuildRateBody(
                                makeupArtistDetailsData:
                                    makeupArtistDetailsData,
                                list: state.data!.rates ?? [],
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
