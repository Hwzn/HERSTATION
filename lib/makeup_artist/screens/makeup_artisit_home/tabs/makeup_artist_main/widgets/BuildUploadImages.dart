// part of 'MakeupArtistWidgetsImports.dart';

// class BuildUploadImages extends StatelessWidget {
//   final MakeupArtistMainData? makeupArtistMainData;
//   ProviderModel? providerModel;

//   BuildUploadImages({Key? key, this.makeupArtistMainData, this.providerModel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//           alignment: AlignmentDirectional.topStart,
//           child: MyText(
//             title: tr(context, "galleryImages"),
//             color: MyColors.primary,
//             size: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         ListView.builder(
//           //physics: const NeverScrollableScrollPhysics(),
//           scrollDirection: Axis.horizontal,
//           itemCount: providerModel?.gallery?.length ?? 0,
//           shrinkWrap: true,
//           itemBuilder: (BuildContext context, int index) {
//             //children: [
//             //  state.data
//             //  ?
//             // Container(
//             //   alignment: AlignmentDirectional.topStart,
//             //   child:
//             //    Wrap(
//             //     children:
//             // makeupArtistMainData.imageFiles!.map((image)
//             //  providerModel?.gallery[index].image??'',
//             // {
//             return Column(
//               children: [
//                 Container(
//                   alignment: AlignmentDirectional.topStart,
//                   margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
//                   height: 80,
//                   width: 80,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15.0),
//                     child:
//                         Image.asset(providerModel?.gallery?[index].image ?? ''),
//                     // Image.file(
//                     //   File(image.path),
//                     //   fit: BoxFit.fill,
//                     // ),
//                   ),
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: MyColors.bgPrimary),
//                     margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                     padding: const EdgeInsets.all(15),
//                     height: //state.data ?
//                         100, //: 150,
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       Res.upload,
//                       width: 75,
//                       height: 75,
//                     ),
//                   ),
//                   onTap: () =>
//                       makeupArtistMainData?.showUploadImagesDialog(context),
//                 ),
//               ],
//             );
//             //  }).toList(),
//             //),
//             // );
//             // : Container();

//             // ],
//           },
//         ),
//       ],
//     );
//   }
// }
//============================================================================================
//============================================================================================
//============================================================================================
part of 'MakeupArtistWidgetsImports.dart';

class BuildUploadImages extends StatelessWidget {
  final MakeupArtistMainData makeupArtistMainData;
  ProviderModel? providerModel;

  BuildUploadImages(
      {Key? key, required this.makeupArtistMainData, this.providerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
          alignment: AlignmentDirectional.topStart,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: tr(context, "galleryImages"),
                color: MyColors.primary,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              // BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              //     bloc: makeupArtistMainData.showUpdateImage,
              //     builder: (context, state) {
              //       return Visibility(
              //         visible: state.data,
              //         child: GestureDetector(
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Image.asset(
              //                 Res.edit,
              //                 height: 15,
              //                 width: 15,
              //               ),
              //               const SizedBox(
              //                 width: 5,
              //               ),
              //               MyText(
              //                 title: tr(context, "update"),
              //                 color: MyColors.primary,
              //                 size: 13,
              //               ),
              //             ],
              //           ),
              //           onTap: () {
              //             makeupArtistMainData.updateImages(context,
              //                 makeupArtistMainData.imageFiles ?? []);
              //           },
              //         ),
              //       );
              //     }),
            ],
          ),
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: makeupArtistMainData.showImagesGalleryCubit,
            builder: (context, state) {
              return Column(
                children: [
                  state.data
                      ? Container(
                          alignment: AlignmentDirectional.topStart,
                          child: Wrap(
                            children:
                                makeupArtistMainData.imageXFiles!.map((image) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5, right: 5),
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.file(
                                    File(image.path),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : providerModel!.gallery!.isNotEmpty
                          ?Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Wrap(
                              children: providerModel!.gallery!.map((image) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, left: 5, right: 5),
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: CachedImage(
                                      url: image.image ?? "",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),)
                          : Container(),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: MyColors.bgPrimary),
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: const EdgeInsets.all(15),
                      height: state.data ? 100 : 150,
                      alignment: Alignment.center,
                      child: Image.asset(
                        Res.upload,
                        width: 75,
                        height: 75,
                      ),
                    ),
                    onTap: () =>
                        makeupArtistMainData.showUploadImagesDialog(context),
                  )
                ],
                //},
              );
            }),
      ],
    );
  }
}
