part of 'splashWidgetsImports.dart';

class BuildSplashLogo extends StatelessWidget {
  const BuildSplashLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Hero(
          tag: Res.logo,
          child: Image.asset(
            Res.logo,
            height: 250,
            width: 250,
          ),
        ),
      ),
    );
  }
}
