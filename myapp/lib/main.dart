import 'package:flutter/material.dart';
import 'package:myapp/film.dart';
import 'package:myapp/login.dart';
import 'package:myapp/providers/auth_provider.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:provider/provider.dart';

const digital_blue = Color(0xFF03A9F4);
const digital_blueb = Color(0xFF143D52);
const digital_green = Color(0xFF3FC25C);
const digital_yellow = Color(0xFFF2C94C);
const digital_grey = Color(0xFFBDBDBD);


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
      routes: {
        '/login':(context)=>Login(),
        '/main':(context)=>MainPage(),
      },
    ),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationMenu(),
    // endDrawer: NavigationDrawerWidget(),
    appBar: AppBar(
      elevation: 0,
      backgroundColor: digital_blueb,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SearchSection(),
          ListSection(),
        ],
      ),
    ),
  );
}

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final title = 'Menu';
    final urlImage = 'assets/images/DigitalPACA-Logo_Round_poulpe-en-haut.png';

    return Drawer(
      child: Material(
        color: digital_blue,
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          children: <Widget>[
            MenuHeader(
              urlImage: urlImage,
              title: title,
              onclicked: () => selectedItem(context, 0),
            ),
            SizedBox(height: 40),
            MenuItem(
              text: 'Home',
              icon: Icons.home_outlined,
              onclicked: () => selectedItem(context, 0),
            ),
            MenuItem(
              text: 'Favoris',
              icon: Icons.star_outline,
            ),
            MenuItem(
              text: 'Déconnexion',
              icon: Icons.arrow_back_sharp,
            ),
            MenuItem(
              text: 'Films',
              icon: Icons.ondemand_video,
              onclicked: () => selectedItem(context, 1),
            ),
            MenuItem(
              text: 'Connexion',
              icon: Icons.people,
              onclicked: () => selectedItem(context, 2),
            ),
          ],
        ),
      ),
    );
  }
}

Widget MenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onclicked,
}) {
  final color = Colors.white;
  final hoverColor = digital_blueb;
  return ListTile(
    leading: Icon(icon, color: digital_blueb, size: 30),
    title: Text(text, style: TextStyle(color: color, fontSize: 22)),
    hoverColor: hoverColor,
    onTap: onclicked,
  );
}

Widget MenuHeader({
  required String urlImage,
  required String title,
  VoidCallback? onclicked,
}) =>
    InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              child: Image.asset(
                  urlImage,
                  height: 50,
                  width: 65,
                  fit: BoxFit.fitHeight,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: onclicked,
                  icon: Icon(Icons.close, color: Colors.white, size: 30),
                  ),
            )
          ],
        ),
      ),
    );

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch(index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainPage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FilmPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginPage(),
      ));
      break;
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 20, 10, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[500],
                  size: 30,
                ),
                hintText: "Rechercher",
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: EdgeInsets.fromLTRB(50, 13, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListSection extends StatelessWidget {
  final List filmlist = [
    {
      'title': 'Spider-Man : No way home',
      'date': '15 Décembre 2021',
      'description': "Pour la première fois dans son histoire cinématographique, Spider-Man, le héros sympa du quartier est démasqué...",
      'picture': 'assets/images/Spider-Man No way home poster.jpg',
    },
    {
      'title': 'La méthode Williams',
      'date': '1er Décembre 2021',
      'description': "Pour la première fois dans son histoire cinématographique, Spider-Man, le héros sympa du quartier est démasqué...",
      'picture': 'assets/images/Williams-Affiche.jpeg',
    },
    {
      'title': 'Encanto',
      'date': '24 Novembre 2021',
      'description': "Pour la première fois dans son histoire cinématographique, Spider-Man, le héros sympa du quartier est démasqué...",
      'picture': 'assets/images/maribel-encanto-affiche-france.jpg',
    },
    {
      'title': 'Les Eternels',
      'date': '3 Novembre 2021',
      'description': "Pour la première fois dans son histoire cinématographique, Spider-Man, le héros sympa du quartier est démasqué...",
      'picture': 'assets/images/affiche-eternels.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: filmlist.map((film) {
          return FilmCard(film);
      }).toList(),
      ),
    );
  }
}

class FilmCard extends StatelessWidget {
  final Map filmData;
  FilmCard(this.filmData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
     height: 350,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.all(
         Radius.circular(18),
       ),
       boxShadow: [
         BoxShadow(
           color: Colors.grey.shade300,
           spreadRadius: 4,
           blurRadius: 6,
           offset: Offset(0,3),
         )
       ]
     ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(filmData['picture'],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                    right: -15,
                    child: MaterialButton(
                      color: Colors.transparent,
                      shape: CircleBorder(),
                      onPressed: (){},
                      child: Icon(
                        Icons.star_sharp,
                        color: digital_yellow,
                        size: 30,
                  ),
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(filmData['title'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(filmData['date'],
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(filmData['description'],
                textAlign: TextAlign.left,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

