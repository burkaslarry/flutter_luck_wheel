import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'luckywheel.dart';


class UploadExcelScreen extends StatefulWidget {
  const UploadExcelScreen({super.key, required this.title});
  final String title;

  @override
  State<UploadExcelScreen> createState() => _UploadExcelScreenState();
}

class _UploadExcelScreenState extends State<UploadExcelScreen> {

  void _navigateToLuckyDraw (BuildContext context) {

  }
  // Future<void> _navigateToLuckyDraw(BuildContext context) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['xlsx', 'xls'],
  //   );
  //
  //   if (result != null && result.files.isNotEmpty) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const Screen2(),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please upload lucky namelist by excel (.xls)',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToLuckyDraw(context),
        tooltip: 'Upload Excel',
        child: const Icon(Icons.upload_file),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

