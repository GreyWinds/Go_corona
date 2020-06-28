import 'package:flutter/material.dart';


class SymptomsItems extends StatefulWidget {
  @override
  _SymptomsItemsState createState() => _SymptomsItemsState();
}

class _SymptomsItemsState extends State<SymptomsItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Symptoms',style:TextStyle(color: Colors.white)
      ),
      backgroundColor: Colors.orange,),
      body: 
          SingleChildScrollView(
                      child: Column(
        children: <Widget>[
            SizedBox(height: 16.0,),
                  getSymptomsItems(context, 'Fever'),
            SizedBox(height: 16.0,),
            getSymptomsItems(context, 'Cough'),
            SizedBox(height: 16.0,),
            getSymptomsItems(context, 'Tiredness'),
            SizedBox(height: 16.0,),
            getSymptomsItems(context, 'Difficulty in Breathing'),
            SizedBox(height: 16.0,),


        Image(
          image: AssetImage('images/sdoctor.png'),
        )

,
             Container(
               height: 500,
               padding: EdgeInsets.all(15.0),
               child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  //"The most common symptoms of COVID-19 are fever, tiredness, and dry cough. Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhea. These symptoms are usually mild and begin gradually. Some people become infected but don’t develop any symptoms and don't feel unwell. Most people (about 80%) recover from the disease without needing special treatment. Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart problems or diabetes, are more likely to develop serious illness. People with fever, cough and difficulty breathing should seek medical attention.",
                              "Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus. Most people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment.  Older people, and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness.",
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
             ),



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