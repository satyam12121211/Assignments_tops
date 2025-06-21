import 'package:flutter/material.dart';
class item extends StatefulWidget {
  const item({super.key});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {

  final _items=[];
  final GlobalKey<AnimatedListState>_key=GlobalKey();
  void _additem(){
    _items.insert(0,"item${_items.length+1}");
    _key.currentState!.insertItem(0,duration: Duration(seconds: 1));
  }
  void _removeitem(int index){
    _key.currentState!.removeItem(index,
          (_, animation) {
        return SizeTransition(sizeFactor: animation,
        child: Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text('delete',style: TextStyle(fontSize: 24),),
          ),
        ),
        );
      },
      duration: Duration(seconds: 1)
    );
    _items.removeAt(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(onPressed: _additem, icon: Icon(Icons.add)),
          Expanded(child: AnimatedList(key: _key,
          initialItemCount: 0,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index, animation) {
            return SizeTransition(sizeFactor: animation,
            key: UniqueKey(),
            child: Card(
              margin: EdgeInsets.all(10),
              color: Colors.orangeAccent,
              child: ListTile(
                title:Text(_items[index],style: TextStyle(fontSize: 24),),
                trailing: IconButton(onPressed: (){
                  _removeitem(index);
                }, icon: Icon(Icons.delete)),
              ),
            ),
            );
          },
          )
          )
        ],
      ),
    );
  }
}
