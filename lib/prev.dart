import 'package:flutter/material.dart';


class SymptomsItems2 extends StatefulWidget {
  @override
  _SymptomsItems2State createState() => _SymptomsItems2State();
}

class _SymptomsItems2State extends State<SymptomsItems2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Prevention',style:TextStyle(color: Colors.white)
      ),
      backgroundColor: Colors.orange,),
      body: 
          SingleChildScrollView(
                      child: Column(
        children: <Widget>[
            SizedBox(height: 16.0,width: double.infinity),
            getSymptomsItems(context, 'Wash Hands Often'),
            SizedBox(height: 16.0,),
            getSymptomsItems(context, 'Cough into your elbow'),
            SizedBox(height: 16.0,),
            getSymptomsItems(context, 'Try not to touch your face'),
            SizedBox(height: 16.0,),
            getSymptomsItems(context, 'Practice Social Distancing'),
             SizedBox(height: 16.0,),
            getSymptomsItems(context, 'Stay Home as much as you can!'),
SizedBox(height: 16.0,),
        Image(
          image: AssetImage('images/sdoctor.gif'),
        )
        ],
      ),
          ),
    );
  }
}


class PreventionItems extends StatefulWidget {
  @override
  _PreventionItemsState createState() => _PreventionItemsState();
}

class _PreventionItemsState extends State<PreventionItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      
        getSymptomsItems(context, 'Wash hands often'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Cough into elbow'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, "Don't touch your face"),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Keep safe distance'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Stay home if you can'),
        SizedBox(height: 16.0,),
        
      ],
    );
  }
}

Widget getSymptomsItems(BuildContext context, String text) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xFF1A35E4),
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    child: ListTile(
      leading: Icon(
        Icons.error,
        color: Colors.amber,
      ),
      title: Text(
        text,
        style:
            Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),
      ),
      trailing: Icon(
        Icons.chrome_reader_mode,
        color: Colors.white,
      ),
    ),
  );
}