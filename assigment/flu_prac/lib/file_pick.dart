import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class filePicker extends StatefulWidget {
  const filePicker({super.key});

  @override
  State<filePicker> createState() => _filePickerState();
}

class _filePickerState extends State<filePicker> {
  bool isSelect = false;
  File? f ;
  List<File>? sel ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(
              child: 
              Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    _PickImage();
                  }, child: Text("Pick Image")),
                  
                  ElevatedButton(onPressed: (){
                    _pickMultiple();
                  }, child: Text("multiple")),
                  
                  ElevatedButton(onPressed: (){
                    _opendir();
                    
                  }, child: Text("Directory")),
                  isSelect == true ? FittedBox(child: Image.file(f!),) : Container(),

                  ElevatedButton(onPressed: (){

                    setState(() {
                      isSelect = false;
                    });
                  }, child: Text("Remove photo"))

                  
                ],
              ),
            ),

    );
  }

  void _PickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result != null && result.files.single.path != null){
      PlatformFile file = result.files.first;
      f= File(result.files.single.path!);
      setState(() {
         f;
         isSelect = true;
      });

    }
    else{

    }

  }

  void _pickMultiple() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(result!= null){
      sel = result.paths.map((path) => File(path!)).toList();
      setState(() {
        sel.toString();
      });
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
