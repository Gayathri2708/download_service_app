import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Controller extends GetxController {
  RxList<File> fileNames = <File>[].obs;
  bool loading = false;
  RxDouble progress = 0.0.obs as RxDouble;

  Future<void> openFileFromDirectory() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        List<File> fileNames =
            result.paths.map((path) => File(path!.split('/').last)).toList();
        fileNames.addAll(fileNames);
      }
    } catch (e) {
      print('File picking failed: $e');
    }
  }

  void addFileName(String fileName) {
    fileNames.add(fileName as File);
  }

  void clearFileNames() {
    fileNames.clear();
  }

  // Future<bool> requestPermission(Permission permission) async {
  //   if (await permission.isGranted) {
  //     return true;
  //   } else {
  //     var result = await permission.request();
  //     if (result == PermissionStatus.granted) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // Future<bool> saveVideo(String url, String fileName) async {
  //   Directory? directory;
  //   Dio dio = Dio();
  //   try {
  //     if (Platform.isAndroid) {
  //       if (await requestPermission(Permission.storage)) {
  //         directory = await getExternalStorageDirectory();
  //         String newPath = "";
  //         print(directory);
  //         List<String> paths = directory!.path.split("/");
  //         for (int x = 1; x < paths.length; x++) {
  //           String folder = paths[x];
  //           if (folder != "Android") {
  //             newPath += "/" + folder;
  //           } else {
  //             break;
  //           }
  //         }
  //         newPath = newPath + "/RPSApp";
  //         directory = Directory(newPath);
  //       } else {
  //         return false;
  //       }
  //     } else {
  //       if (await requestPermission(Permission.photos)) {
  //         directory = await getTemporaryDirectory();
  //       } else {
  //         return false;
  //       }
  //     }

  //     if (!await directory.exists()) {
  //       await directory.create(recursive: true);
  //     }
  //     if (await directory.exists()) {
  //       File saveFile = File(directory.path + "/$fileName");
  //       await dio.download(url, saveFile.path,
  //           onReceiveProgress: (value1, value2) {
  //         updateProgress(value1.toDouble(), value2.toDouble());
  //       });
  //       if (Platform.isIOS) {
  //         await ImageGallerySaver.saveFile(saveFile.path,
  //             isReturnPathOfIOS: true);
  //       }
  //       return true;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return false;
  // }

  // void updateProgress(double value1, double value2) {
  //   progress = (value1 / value2) as RxDouble;
  // }

  // Future<void> downloadFile() async {
  //   loading = true;
  //   progress = 0.0 as RxDouble;

  //   String url =
  //       "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4";
  //   // String filename = "video.mp4";

  //   try {
  //     bool downloaded = await saveVideo(url, fileNames.toString());
  //     if (downloaded) {
  //       print("File Downloaded");
  //     } else {
  //       print("Problem Downloading File");
  //     }
  //   } catch (e) {
  //     print("Error downloading file: $e");
  //   } finally {
  //     loading = false;
  //   }
  // }
}
