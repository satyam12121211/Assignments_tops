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
      body: ElevatedButton(onPressed: (){

      }, child:Text('PhotoPicker',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ),
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

}
