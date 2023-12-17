import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../model/registermodel.dart';
import 'luckywheel.dart';


class UploadExcelScreen extends StatefulWidget {
  const UploadExcelScreen({super.key, required this.title});
  final String title;

  @override
  State<UploadExcelScreen> createState() => _UploadExcelScreenState();
}

class _UploadExcelScreenState extends State<UploadExcelScreen> {
  String message = "";


  void _navigateToLuckyDraw(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Select CSV',
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    print(result);

    if (result != null && result.files.isNotEmpty) {
      var fileBytes = result.files.first.bytes;
      var formater = String.fromCharCodes(fileBytes!);

      List<RegistersModel> listLuckerDrawer = [];
      final contacts = formater.split(';'); // Carriage Return ascii code 13
      for (int i = 0; i < contacts.length - 1; i++) {
        final contactData = contacts[i].split(',');
        listLuckerDrawer.add(RegistersModel(
            name: contactData[0],
            email: contactData[1]
        ));
      }

      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LuckyWheelPage(items: listLuckerDrawer)),
      );
    } else {
      //return 'O documento não foi retornado';
    }
    // Redirect to the next page after the file upload is complete
  }

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

