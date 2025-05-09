import 'package:flutter/material.dart';
import 'package:note/data/local/db_helper.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();
  List<Map<String,dynamic>> allNotes =[];
  DBHelper? dbRef;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef =DBHelper.getInstance;
    getNotes();
  }
  void getNotes()async{
    allNotes =await dbRef!.getAllNotes();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notes'),
      ),
      body:allNotes.isNotEmpty ? ListView.builder(
          itemCount: allNotes.length
          ,itemBuilder: (_, index){
        ListTile(
          leading: Text('${index+1}'),
          title: Text(allNotes[index][DBHelper.COLUMN_NOTE_TITLE]),
          subtitle: Text(allNotes[index][DBHelper.COLUMN_NOTE_DESC]),
          trailing: SizedBox(
            width: 50,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: (){
                      showModalBottomSheet(context:context,
                          builder:(context){
                            titleController.text=allNotes[index][DBHelper.COLUMN_NOTE_TITLE];
                            descController.text=allNotes[index][DBHelper.COLUMN_NOTE_DESC];
                            return getBottomSheetWidget(isUpdate: true,sno: allNotes[index][DBHelper.COLUMN_NOTE_SNO]);
                          });
                    },
                    child: Icon(Icons.edit)),
                InkWell(
                    onTap: ()async{
                      bool check =await dbRef!.deletNote(sno: allNotes[index][DBHelper.COLUMN_NOTE_SNO]);
                      if(check){
                        getNotes();
                      }
                    },
                    child: Icon(Icons.delete,color: Colors.red,))],
            ),
          ),
        );
      } ):Center(
        child: Text('no notes yet!!'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        String errorMsg="";
        bool check=await dbRef!.addNote(mTitle: 'personal fav note', mDesc: 'do what you love');
        showModalBottomSheet(context:context , builder:(context){
          titleController.clear();
          descController.clear();
          return getBottomSheetWidget();
        });
      },child: Icon(Icons.add),),
    );

  }
  Widget getBottomSheetWidget({bool isUpdate=false, int sno=0}){
    return Container(
      padding: EdgeInsets.all(11),
      width: double.infinity,
      child: Column(
        children: [
          Text(isUpdate ? 'Update Note':'add note',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 21,
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text('Title*'),
              hintText: 'Enter title here',
              focusedBorder: OutlineInputBorder(borderRadius:
              BorderRadius.circular(11)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),

            ),
          ),
          SizedBox(
            height: 21,
          ),
          TextField(
            controller: descController,
            maxLines: 4,
            decoration: InputDecoration(
                label: Text('Desc*'),
                hintText: 'Enter desc here',
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11))
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(side: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(11))
                ),
                    onPressed:()async{
                      var Title=titleController.text;
                      var Desc=descController.text;
                      if(Title.isNotEmpty && Desc.isNotEmpty){
                        bool check=isUpdate
                            ? await dbRef!.updateNote(
                            mTitle: Title, mDesc: Desc, sno: sno)
                            :await dbRef!.addNote(
                            mTitle: Title, mDesc: Desc);
                        if(check){
                          getNotes();
                        }else{

                        }
                        Navigator.pop(context);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Please fill all the required blanks') ));
                      }
                      titleController.clear();
                      descController.clear();

                    }, child:Text(isUpdate ? 'Update Note':'Add note') ),
              ),
              SizedBox(width: 11,),
              Expanded(
                child:OutlinedButton(style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(side: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(11))
                ),onPressed:(){
                  Navigator.pop(context);
                }, child:Text('Cancel') ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
