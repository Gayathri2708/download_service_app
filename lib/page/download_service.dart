import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:to_do_application/controller/controller.dart';

class DownloadService extends StatelessWidget {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Download functionality',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: c.openFileFromDirectory, child: Text('Upload File')),
            SizedBox(
              height: 30,
            ),
            // Obx(() {
            //   return Column(
            //     children: c.fileNames.map((fileName) {
            //       return Text(fileName.toString());
            //     }).toList(),
            //   );
            // }),
            Expanded(child: Obx(() {
              return ListView.builder(
                  itemCount: c.fileNames.length,
                  itemBuilder: (context, index) {
                    String? fileNames = c.fileNames.map((fileName) {
                      return fileName.toString();
                    }).toList()[index];
                    return Card(
                      child: ListTile(
                        leading: getFileIcon(fileNames),
                        title: Text(
                          fileNames,
                        ),
                        trailing: Icon(Icons.download),
                      ),
                    );
                  });
            }))
          ],
        ),
      ),
    );
  }
}

Widget getFileIcon(String fileName) {
  if (fileName.endsWith('.pdf')) {
    return Icon(Icons.picture_as_pdf, color: Colors.red);
  } else if (fileName.endsWith('.png') ||
      fileName.endsWith('.jpg') ||
      fileName.endsWith('.jpeg')) {
    return Icon(Icons.image, color: Colors.blue);
  } else if (fileName.endsWith('.mp4') ||
      fileName.endsWith('.avi') ||
      fileName.endsWith('.mov')) {
    return Icon(Icons.movie, color: Colors.green);
  } else {
    return Icon(Icons.insert_drive_file);
  }
}
