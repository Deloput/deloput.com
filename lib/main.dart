/**
 * Author: Kirill Davydov
 * profile: https://www.linkedin.com/in/kirilldavydov/
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
//        actions: <Widget>[
//          IconButton(icon: Icon(FontAwesomeIcons.commentDots, color: Colors.black54,), onPressed: (){}, ),
//          IconButton(icon: Icon(Icons.more_vert, color: Colors.black54,), onPressed: (){},)
//        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200
              ),
              child: Text("Creative & highly motivated digital product development leader with more than 10 years of managerial experience in software development and in the financial industries with strong numerical and communication skills in Russian and English."),
            ),
//            _buildTitle("Skills"),
//            SizedBox(height: 10.0),
//            _buildSkillRow("Strategy Execution",0.75),
//            SizedBox(height: 25.0),
//            _buildSkillRow("Product Development",0.6),
//            SizedBox(height: 5.0),
//            _buildSkillRow("Resources Managment",0.65),
//            SizedBox(height: 5.0),
//            _buildSkillRow("Applications Development",0.5),
//            SizedBox(height: 30.0),

            _buildTitle("Experience"),
            _buildExperienceRow(company: "Exness", position: "Head Of Development", duration: "2017 - 2020"),
            _buildExperienceRow(company: "Acronis", position: "Head Of Mobile Development", duration: "2015 - 2017"),
            _buildExperienceRow(company: "Kibo", position: "Co-Founder & CTO", duration: "2015"),
            _buildExperienceRow(company: "Alfa-Bank", position: "Team Leader", duration: "2012 - 2015"),
            _buildExperienceRow(company: "GasiCredit", position: "Co-Founder & CTO", duration: "2013"),
            _buildExperienceRow(company: "SeoPult Group", position: "Team Leader", duration: "2011 - 2012"),
            _buildExperienceRow(company: "ID_COMPANY", position: "Senior iOS Developer", duration: "2011"),
            _buildExperienceRow(company: "ROSATOM Group", position: "IT Manager", duration: "2011"),


            SizedBox(height: 20.0),
            _buildTitle("Education"),
            SizedBox(height: 5.0),
            _buildExperienceRow(company: "Bauman Moscow State Technical University Training Center", position: "Advanced graphical applicaions and games development", duration: "2014"),
            _buildExperienceRow(company: "VORSTU, Russia", position: "Master in Information Systems", duration: "2005 - 2011"),
            _buildExperienceRow(company: "VSU, Russia", position: "English To Russian Translator", duration: "2008 - 2009"),


            SizedBox(height: 20.0),
            _buildTitle("Contact"),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Icon(Icons.mail, color: Colors.black54,),
                SizedBox(width: 10.0),
                Text("kirill@deloput.com", style: TextStyle(
                    fontSize: 16.0
                ),),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Icon(Icons.phone, color: Colors.black54,),
                SizedBox(width: 10.0),
                Text("+35797698636", style: TextStyle(
                    fontSize: 16.0
                ),),
              ],
            ),
            _buildSocialsRow(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Row _buildSocialsRow() {
    return Row(
      children: <Widget>[
        SizedBox(width: 20.0),
        IconButton(
          color: Colors.black54,
          icon: Icon(FontAwesomeIcons.facebookF),
          onPressed: (){
            _launchURL("https://www.facebook.com/kadavydov");
          },
        ),
        SizedBox(width: 5.0),
        IconButton(
          color: Colors.black54,
          icon: Icon(FontAwesomeIcons.github),
          onPressed: (){
            _launchURL("https://github.com/deloput");
          },
        ),
        SizedBox(width: 5.0),
        IconButton(
          color: Colors.black54,
          icon: Icon(FontAwesomeIcons.youtube),
          onPressed: (){
            _launchURL("https://youtube.com/c/deloputtv");
          },
        ),
        SizedBox(width: 10.0),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _buildExperienceRow({String company, String position, String duration}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(FontAwesomeIcons.solidCircle, size: 12.0, color: Colors.black54,),
      ),
      title: Text(company, style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        SizedBox(width: 16.0),
        Expanded(
            flex: 2,
            child: Text(skill.toUpperCase(), textAlign: TextAlign.right,)),
        SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title.toUpperCase(), style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
          ),),
          Divider(color: Colors.black54,),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(children: <Widget>[
      SizedBox(width: 20.0),
      Container(
          width: 80.0,
          height: 80.0,
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/Avatar.gif')))),
      SizedBox(width: 20.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
            children: [
              Text("Kirill Davydov", style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.0),
              Text("Founder & CEO at A Day Ltd."),
              SizedBox(height: 5.0),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(FontAwesomeIcons.map, size: 10.0, color: Colors.black54,),
              SizedBox(width: 10.0),
              Text("Limassol, Cyprus", style: TextStyle(
                  color: Colors.black54
              ),),
            ],
          ),
        ],
      )
    ],);
  }
}
