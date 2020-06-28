import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:pie_chart/pie_chart.dart';
import 'constants.dart';
import 'report.dart';


var cases = 10075115;
var deaths = 500624;
var recovered = 5454548;
var crit = 1573, case1m = 56, death1m = 2, tod = 7;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  Map<String, double> dataMap = new Map();
  String country='China';
  
  Future<dynamic> getData(country) async {
    Response res = await get('https://disease.sh/v2/countries/$country?yesterday=true&strict=true&allowNull=true');
    var body = res.body;
    var dd = jsonDecode(body);
    print(dd);

    //=> In order to update the values from the default values defined.
    //=> set state will also trigger a rebuild with the new values.
    setState(() {
      cases = dd['cases'];
      deaths = dd['deaths'];
      recovered = dd['recovered'];
      crit = dd['critical'];
      case1m = dd['casesPerOneMillion'];
      death1m = dd['deathsPerOneMillion'];
      tod = dd['deathsPerOneMillion'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData(country);
    dataMap.putIfAbsent("Global Cases", () => 10075115 );
    dataMap.putIfAbsent("Global Deaths", () => 500624);
    dataMap.putIfAbsent("Recovered", () =>  5454548);
  }

  @override
  List<Color> clist = [Colors.orange, Colors.red, Colors.green];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(      
            icon: Icon(Icons.arrow_back),
            onPressed:() {Navigator.pop(context);}
          ),
          title: Text(
            'Country Report',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    country = value;
                    setState(() {
                      getData(country);
                    });
                  },
                ),
              ),
              Container(
                  height: 100.0,
                  width: double.infinity,
                  color: Colors.blue[700],
                  child: Center(
                      child: Text(
                    'COVID-19 $country Report',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))),
              SizedBox(
                width: double.infinity,
                height: 30.0,
              ),
              PieChart(
                dataMap: dataMap,
                chartType: ChartType.ring,
                showChartValuesOutside: false,
                colorList: clist,
              ),
              DataBox(s: "Cases: $cases"),
              DataBox(s: 'Deaths: $deaths'),
              DataBox(s: 'Recovered: $recovered'),
              DataBox(s: 'Critical: $crit'),
              DataBox(s: 'Cases/One Million: $case1m'),
              DataBox(s: 'Deaths/One Million: $death1m'),
              DataBox(s: 'Today Deaths: $tod'),
              SizedBox(
                width: double.infinity,
                height: 30.0,
              ),
              Image(
                image: AssetImage('images/covidmap.png'),
              )
            ],
          ),
        ));
  }
}




class DataBox extends StatelessWidget {
  final String s;
  DataBox({this.s});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.blue[700],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            s,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
