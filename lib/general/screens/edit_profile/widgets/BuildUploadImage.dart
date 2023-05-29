part of 'EditProfileWidgetsImports.dart';

class BuildUploadImage extends StatelessWidget {
  final EditProfileData editProfileData;

  const BuildUploadImage({
    Key? key,
    required this.editProfileData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
        bloc: editProfileData.imageCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return InkWell(
              onTap: () => editProfileData.getImage(context),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: MyColors.secondary, width: 3),
                ),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.file(
                      state.data!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return InkWell(
              onTap: () => editProfileData.getImage(context),
              child: editProfileData.profileImgUrl.isEmpty
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 120,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: MyColors.secondary, width: 3),
                      ),
                      child: Image.asset(
                        Res.gallery,
                        height: 50,
                        width: 50,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: MyColors.secondary, width: 3),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: CachedImage(
                              fit: BoxFit.fill,
                              haveRadius: true,
                              borderRadius: BorderRadius.circular(25),
                              url: editProfileData.profileImgUrl,
                            ),
                      ),
                    ),
            );
          }
        });
  }
}
