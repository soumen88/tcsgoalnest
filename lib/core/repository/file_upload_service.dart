import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as pathPlugin;

import '../dependency/injectable_setup.dart';
import '../network/dio_utils.dart';
import '../utils/logger_util.dart';


class FileUploadService {
  final _logger = locator<LoggerUtil>();
  final _TAG = "FileUploadService";
  late Dio dioInstance;

  Future<File> getImageFileFromAssets(String path) async {
    // Load the byte data from the asset
    final byteData = await rootBundle.load(path);

    // Get the temporary directory path
    var appDir = await getApplicationDocumentsDirectory();
    var folderName = "assetFilesConverted";
    var folderPath = pathPlugin.join(appDir.path, folderName);
    if(!Directory(folderPath).existsSync()){
      Directory(folderPath).create(recursive: true);
    }

    // Create a file path with a unique name
    // You might want to extract the actual filename from the 'path' argument
    final String fileName = path.split('/').last;
    final File file = File('$folderPath/$fileName');

    // Create the file recursively to ensure the directory exists
    await file.create(recursive: true);

    // Write the byte data to the file
    await file.writeAsBytes(byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    ));

    _logger.log(TAG: _TAG, message: "File created successfully at path: ${file.path}");
    return file;
  }

  Future<void> uploadFileToBucket(String filePath) async{
    try{
      final file = await MultipartFile.fromFile(filePath);
      dioInstance = await DioUtils().getDioInstanceForFileUpload();
      await dioInstance.post("dac8gxz3w/image/upload", data: {
        "file=": file,
      }).then((response) {
        _logger.log(TAG: _TAG, message: "File uploaded successfully ${response.data}");
      }).catchError((error, stackTrace) {
        _logger.log(TAG: _TAG, message: "Error occurred $error and stackTrace $stackTrace");
      });
    }
    catch(exception, stackTrace){
      _logger.log(TAG: _TAG, message: "Error occurred $exception and stacktrace $stackTrace");
    }
  }

  /// Uploads an image file to Cloudinary using the API details.
  /// 
  /// [filePath]: Local path to the image file to upload.
  /// [cloudName]: Your Cloudinary cloud name.
  /// [apiKey]: Your Cloudinary API key.
  /// [apiSecret]: Your Cloudinary API secret.
  /// [publicId]: The desired public id for the uploaded image (optional).
  /// Returns the Cloudinary response.
  Future<Response?> uploadFileToCloudinary({
    required String filePath,
    required String cloudName,
    required String apiKey,
    required String apiSecret,
    String? publicId,
  }) async {
    final url = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';
    try {
      final file = await MultipartFile.fromFile(filePath);

      final formDataMap = <String, dynamic>{
        "file": file,
      };
      if (publicId != null) {
        formDataMap['public_id'] = publicId;
      }

      final formData = FormData.fromMap(formDataMap);

      dioInstance = Dio();

      // Basic Auth header
      final String basicAuth = "Basic " +
          base64Encode(utf8.encode("$apiKey:$apiSecret"));

      final response = await dioInstance.post(
        url,
        data: formData,
        options: Options(
          headers: {
            "Authorization": basicAuth,
          },
        ),
      );

      _logger.log(TAG: _TAG, message: "Cloudinary upload response: ${response.data}");

      return response;
    } catch (e, s) {
      _logger.log(TAG: _TAG, message: "Cloudinary upload error: $e stack: $s");
      return null;
    }
  }
}