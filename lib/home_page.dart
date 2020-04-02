import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/ocorrenciasmorador.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Notícias do Condomínio"),
        backgroundColor: Colors.blue,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                  'Jorge Jorge'), //colocaremos conforme o perfil do morador
              accountEmail: new Text('jorge@Jorge.com'),
              currentAccountPicture: new GestureDetector(
                onTap: () => print('Toque na imagem'),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(''),
                ),
              ),
            ),
            new ListTile(
              title: new Text("Início / Notícias do Condomínio"),
              leading: const Icon(Icons.home),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => Listar()));
              },
              leading: const Icon(Icons.announcement),
              title: new Text("Ocorrências"),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Sair"),
              trailing: new Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      body: new Center(
        child: new Text("Em construção..."),
      ),
    );
  }
}
