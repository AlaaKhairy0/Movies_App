import 'dart:io';

import 'package:flutter/material.dart';

import '../../result.dart';

class ErrorStateWidget extends StatelessWidget {
  ErrorStateWidget(
      {super.key,
      this.serverError,
      this.error,
      this.retryTxt,
      this.retryButtonAction});

  ServerError? serverError;
  Error? error;
  String? retryTxt;
  VoidCallback? retryButtonAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            extractError(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 4,
          ),
          if (retryTxt != null)
            ElevatedButton(
                onPressed: () {
                  retryButtonAction?.call();
                },
                child: Text(retryTxt!))
        ],
      ),
    );
  }

  String extractError() {
    String message = 'something went wrong';
    if (serverError?.message != null) {
      return message = serverError!.message;
    } else if (error?.exception != null) {
      Exception ex = error!.exception;
      switch (ex) {
        case SocketException():
          message = 'No Internet connection';
        case HttpException():
          message = 'Couldn\'t find the post';
        case FormatException():
          message = 'Bad response format';
      }
      return message;
    }
    return message;
  }
}
