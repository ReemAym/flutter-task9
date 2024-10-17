import 'package:url_launcher/url_launcher.dart';

import 'custom-snackbar.dart';

Future<void> CustomLaunchUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      customSnackBar(context, 'cannot launch $url');
    }
  }
}
