import 'dart:io';
import 'dart:isolate';

import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/core/repository/file_upload_service.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/italic_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/outline_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

@RoutePage()
class DisplayCommonWidgetsScreen extends StatefulWidget {
  @override
  State<DisplayCommonWidgetsScreen> createState() => _DisplayCommonWidgetsScreenState();
}

class _DisplayCommonWidgetsScreenState extends State<DisplayCommonWidgetsScreen> {
  final _logger = LoggerUtil();
  final _TAG = "DisplayCommonWidgetsScreen";
  String _outputResult = "No Calculation Performed";
  final FileUploadService _fileUploadService = FileUploadService();
  ///Comparison between main thread and a background (worker) thread
  ///
  Future<void> startWorker() async{
    _logger.log(TAG: _TAG, message: "Before Triggering worker thread ${Isolate.current.debugName}");
      ///Left side indicates the input port, and right side will be the output port
    _outputResult = await compute<int, String>(doHeavyCalculation, 150000000);
     _logger.log(TAG: _TAG, message: "Result received after doing work $_outputResult ${Isolate.current.debugName}");
     setState(() {

     });

  }

  static String doHeavyCalculation(int numberOfTimes){
    print("Start time of calculation ${DateTime.now()} working on thread ${Isolate.current.debugName}");
    double sumOfSquares = 0;
    for(int i = 0; i < numberOfTimes; i++){
      int squareOfNumber = i * i;
      sumOfSquares = sumOfSquares + squareOfNumber;
    }
    //_logger.log(TAG: _TAG, message: "End time of calculation ${DateTime.now()} output $sumOfSquares working on thread  ${Isolate.current.debugName}");
    print("End time of calculation ${DateTime.now()} working on thread ${Isolate.current.debugName}");
    return "output $sumOfSquares working on thread ";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldTextWidget(
                textToDisplay: "We are learning about common widgets",
                textAlignment: TextAlign.center,
                fontSize: 30,
            ),
            FilledButtonWidget(
                buttonCaption: "Let's Get Started",
                onButtonPress: (){
                  _logger.log(TAG: _TAG, message: "Button was pressed");
                },
            ),
            BoldTextWidget(
              textToDisplay: "Outline Button Sample",
              textAlignment: TextAlign.center,
            ),
            FilledButtonWidget(
              buttonCaption: "Login",
            ),
            OutlineButtonWidget(
              buttonCaption: "Continue",
            ),

            RegularTextWidget(
                textToDisplay: "Hi, I am a regular text"
            ),
            RegularTextWidget(
                textToDisplay: " Making it easy to implement sustainable resource-efficient architectures, reducing unnecessary cloud waste and enhancing data privacy options.",
                textAlignment: TextAlign.center,
            ),
            RegularTextWidget(
                textToDisplay: "Hi, below is a italic text widget"
            ),
            ItalicTextWidget(
                textToDisplay: "Building and maintaining a font collection on the computer you use for design work is an important part of life as a designer. "
            ),
            OutlineButtonWidget(
                buttonCaption: "Calculate square",
                onButtonPress: (){
                  startWorker();
                },
            ),
            BoldTextWidget(
                textToDisplay: "Result after heavy calculation - $_outputResult",
                fontSize: 20,
            ),
            OutlineButtonWidget(
                buttonCaption: "Test Upload File",
                onButtonPress: () async{
                    await _fileUploadService.getImageFileFromAssets(ImageConstants.kLogoOnly).then((File fileTobeUploaded) async{
                       //await FileUploadService().uploadFileToBucket(fileTobeUploaded.path);
                       await _fileUploadService.uploadFileToCloudinary(
                        filePath: fileTobeUploaded.path,
                        cloudName: "dac8gxz3w",
                        apiKey: "716147748745242",
                        apiSecret: "sg6x_AwYIsXLkKahD0fYFZYztZk",
                      
                      );
                    });
                    //_logger.log(TAG: _TAG, message: "Path where file was stored ${logoFile.path}");
                },
            )
          ],
        ),
      ),
    );
  }
}
