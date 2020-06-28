import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prevent COVID-19',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFF1A35E4),
              width: double.infinity,
              height: 400.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      getHomePageNavItems(
                          context: context,
                          icon: Icons.mood_bad,
                          title: 'Symptoms',
                          subTitle: 'Signs to Identify the risk of Infection',
                          navigate: 'sympton'),
                      SizedBox(
                        width: 16.0,
                      ),
                      getHomePageNavItems(
                          context: context,
                          icon: FontAwesomeIcons.solidHospital,
                          title: 'Prevention',
                          subTitle:
                              'Steps you can take to avoid getting infected',
                          navigate: 'prev'),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      getHomePageNavItems(
                          context: context,
                          icon: Icons.insert_chart,
                          title: 'Reports',
                          subTitle:
                              'Global Data and info related to the disease',
                          navigate: 'greports'),
                      SizedBox(
                        width: 16.0,
                      ),
                      getHomePageNavItems(
                          context: context,
                          icon: FontAwesomeIcons.globeAmericas,
                          title: 'Search',
                          subTitle:
                              'Search Reports of Countries infected by COVID-19',
                          navigate: 'country'),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Image(image: AssetImage('images/main.png'))
          ],
        ),
      ),
    );
  }
}

Widget getHomePageNavItems(
    {BuildContext context,
    IconData icon,
    String title,
    String subTitle,
    String navigate}) {
  return Expanded(
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/$navigate');
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              size: 32.0,
              color: Colors.amber,
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 10.0),
            ),
          ],
        ),
      ),
    ),
  );
}
