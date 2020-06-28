import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:pie_chart/pie_chart.dart';

var cases = 10075115;
var deaths = 500624;
var recovered = 5454548;

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  Map<String, double> dataMap = new Map();

  Future<dynamic> getData() async {
    Response res = await get('https://disease.sh/v2/all?yesterday=true&allowNull=true');
    var body = res.body;
    var dd = jsonDecode(body);
    print(dd);

    //=> In order to update the values from the default values defined.
    //=> set state will also trigger a rebuild with the new values.
    setState(() {
      cases = dd['cases'];
      deaths = dd['deaths'];
      recovered = dd['recovered'];
      return dd;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    dataMap.putIfAbsent("Cases", () => cases.toDouble());
    dataMap.putIfAbsent("Deaths", () => deaths.toDouble());
    dataMap.putIfAbsent("Recovered", () => recovered.toDouble());
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
            'Global Report',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  height: 100.0,
                  width: double.infinity,
                  color: Colors.blue[700],
                  child: Center(
                      child: Text(
                    'COVID-19 Global Report',
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
