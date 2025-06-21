import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
class filepicker extends StatefulWidget {
  const filepicker({super.key});

  @override
  State<filepicker> createState() => _filepickerState();
}

class _filepickerState extends State<filepicker> {
  bool istype=false;
  File? f;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('👾💀☠️👻👽👹'),
      backgroundColor: Theme.of(context).colorScheme.primary),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            _pickerfile();
          }, child:Text('PhotoPicker',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ),
          ElevatedButton(onPressed: (){
            _opendir();

          }, child: Text("Directory")),
          istype == true ? FittedBox(child: Image.file(f!),) : Container(),
        ],
      ),
      
    );
  }
  void _pickerfile()async{
    FilePickerResult? result=await FilePicker.platform.pickFiles();
    if(result !=null && result.files.single.path !=null){
      PlatformFile file=result.files.first;
      f=File(result.files.single.path!);
      setState(() {
        istype=true;
        f;
      });
    }else{

    }
  }
  void _opendir()async {
    String? sel_dir = await FilePicker.platform.getDirectoryPath();
    if(sel_dir != null){
      setState(() {
        sel_dir;
      });
    }

  }

}
