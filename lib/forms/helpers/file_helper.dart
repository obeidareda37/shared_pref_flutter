import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class FileHelper{
  FileHelper._();
  static FileHelper fileHelper= FileHelper._();
  writeInFile(String fileName) async{
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = join(directory.path,fileName+ '.text');


   File file = File(filePath);
   file.writeAsString('hello are you');
  }

  Future<String> readFromFile(String fileName)async{
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = join(directory.path,fileName+ '.text');

    File file = File(filePath);
    String fileContent = await file.readAsString();
    print(fileContent);
    return fileContent;

  }

}