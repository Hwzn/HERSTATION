part of 'AboutWidgetsImports.dart';

class BuildAboutView extends StatelessWidget {
  final String text;

  const BuildAboutView({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: MyColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
              top: Radius.circular(10),
            ),
          ),
          margin: const EdgeInsets.all(15),
          child: Container(
              padding: const EdgeInsets.all(20),
              child: MyText(
                title: text,
                color: MyColors.black,
                size: 14,
              )

              // Html(data: text),
              ),
        ));
  }
}
