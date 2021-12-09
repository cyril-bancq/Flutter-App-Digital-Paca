import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'main.dart';


const digital_blue = Color(0xFF03A9F4);
const digital_blueb = Color(0xFF143D52);
const digital_green = Color(0xFF3FC25C);
const digital_yellow = Color(0xFFF2C94C);
const digital_grey = Color(0xFFBDBDBD);

class FilmPage extends StatefulWidget {
  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  final urlImage = "assets/images/Spider-Man No way home poster.jpg";
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationMenu(),
    // endDrawer: NavigationDrawerWidget(),
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(270),
      child: AppBar(
        elevation: 0,
        flexibleSpace: Image(
          image: AssetImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
    ),
    body: Column(
      children: [
        FilmTitle(),
        FilmSection(),
      ],
    )
  );
}

class FilmTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: digital_blueb,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Spider-Man: No way home',
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.star_sharp,
                color: digital_yellow,
              ),
          ),
        ],
      ),
    );
  }
}

class FilmSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      color: digital_blueb,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 70.0,
                    lineWidth: 5.0,
                    percent: 0.85,
                    center: Text(
                      "85%",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: digital_green,
                    backgroundColor: Colors.blueGrey,
                  ),
                  SizedBox(height: 15),
                  Container(
                      child: Center(
                        child: (Text("Note du public", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold,fontSize: 15))
                        ),
                      ),
                    ),
                  ],
              ),
              Column(
                children: [
                  Container(
                    height: 110,
                    width: 50,
                    child: VerticalDivider(color: Colors.white),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Text("2h30",style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Text("15 Décembre 2021", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Text("Action/Aventure", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Text("Tous publics", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
            Container(
              color: digital_blueb,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Container(
                    child: Text('Synopsis :', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(bottom: 58),
                    child: Text("Pour la première fois dans son histoire cinématographique, Spider-Man, le héros sympa du quartier est démasqué et ne peut désormais plus séparer sa vie normale de ses lourdes responsabilités de super-héros. Quand il demande de l'aide à Doctor Strange, les enjeux deviennent encore plus dangereux, le forçant à découvrir ce qu'être Spider-Man signifie véritablement.",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
}