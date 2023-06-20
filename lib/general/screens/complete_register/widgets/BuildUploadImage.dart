part of 'CompleteRegisterWidgetsImports.dart';

class BuildUploadImage extends StatelessWidget {
  final CompleteRegisterData completeRegisterData;

  const BuildUploadImage({
    Key? key,
    required this.completeRegisterData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
        bloc: completeRegisterData.imageCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return InkWell(
              onTap: () => completeRegisterData.getImage(context),
              child: Container(
                margin: const EdgeInsets.only( bottom: 20),
                width: 130,
                height: 130,
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
                onTap: () => completeRegisterData.getImage(context),
                child: Container(
                  margin: const EdgeInsets.only( bottom: 20),
                  height: 130,
                  width: 130,
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
                ));
          }
        });
  }
}
