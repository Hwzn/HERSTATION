part of 'WelcomeWidgetImports.dart';

class BuildPageView extends StatelessWidget {
  final WelcomeEntity model;
  final WelcomePageData welcomePageData;

  const BuildPageView({Key? key, required this.model,required this.welcomePageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double margin=(MediaQuery.of(context).size.height/2)+100;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(model.image ?? ""),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(0,margin, 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: MyText(
                title: model.title ?? "",
                size: 18,
                color: MyColors.black,
                alien: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
              child: MyText(
                title: model.desc ?? "",
                size: 15,
                color: MyColors.primary,
                alien: TextAlign.center,
              ),
            ),
           Container(margin: const EdgeInsets.only(bottom: 15, ),child: BuildDotsIndicator(welcomePageData: welcomePageData,),
           ),
            Container(
              width: 110,
              height: 110,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => model.last
                    ? AutoRouter.of(context).push(const LoginRoute())
                    : model.pageCubit?.onUpdateData(model.index! + 1),
                child: Container(
                    margin: const EdgeInsets.all(17),
                    child: CircleProgressBar(
                        foregroundColor: MyColors.primary,
                        backgroundColor: MyColors.bgPrimaryCircle,
                        value: (model.index! + 1) * .333,
                        strokeWidth: 2.5,
                        child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsetsDirectional.only(start: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(Res.arrowcircle,
                                height: 25, width: 25)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
