// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_flutter/view/theme/app_colors.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulHookConsumerWidget {
  final String url;
  final String routeName;
  const WebviewScreen({super.key, required this.url, required this.routeName});
  static String path = "/webview/:url/:routeName";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends ConsumerState<WebviewScreen> with RestorationMixin {
  @override
  String get restorationId => 'webview_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {}

  String name = "";
  bool pageLoading = true;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent('Flutter;Webview')
      ..setOnConsoleMessage((message) {
        log(message.toString());
      })
      ..enableZoom(true)
      ..loadRequest(Uri.parse(widget.url))
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (mounted) {
              setState(() {
                pageLoading = progress < 100;
              });
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                pageLoading = false;
              });
            }
          },
          onNavigationRequest: (NavigationRequest navRequest) async {
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: pageLoading
            ? const Center(
                child: SpinKitRing(
                  color: AppColors.kPrimaryColor,
                  size: 100,
                  lineWidth: 3,
                ),
              )
            : WebViewWidget(controller: _controller),
      ),
    );
  }
}
