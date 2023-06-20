
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {

  Future<Uri> createDynamicLink(String lang, String type, String slug) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
         uriPrefix: 'https://domain.page.link',
        link: Uri.parse('domain/$lang/$type/$slug'),
        androidParameters: AndroidParameters(
            packageName:'sa.hwzn.base',
            minimumVersion: 1,
            fallbackUrl: Uri.parse('domain/$lang/$type/$slug')),
        dynamicLinkParametersOptions: DynamicLinkParametersOptions(shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
        iosParameters: IosParameters(
            bundleId: 'sa.hwzn.base',
            minimumVersion: '1',
            appStoreId: '1614620491'),
    );
    final ShortDynamicLink shortLink = await parameters.buildShortLink();
    Uri url = shortLink.shortUrl;
    return url;
  }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;
        print("=============>>> deepLink ${deepLink?.path}");
        if (deepLink != null) {
          var id = deepLink.path.split("/").last;

        }
      });
      final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        var id = deepLink.path.split("/").last;

      }
    } catch (e) {
      print(e.toString());
    }
  }


}
