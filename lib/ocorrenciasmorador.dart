import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/adicionar_ocorrencias.dart';
import 'package:flutter_login_page_ui/home_page.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'main.dart';
import 'models/itemocorrencia.dart';

class Listar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listagem de ocorrencias',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListarOcorrencias(
        title: 'Lista de Ocorrências',
      ),
    );
  }
}

class ListarOcorrencias extends StatefulWidget {
  ListarOcorrencias({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ListarOcorrenciasState createState() => _ListarOcorrenciasState();
}

class _ListarOcorrenciasState extends State<ListarOcorrencias> {
  Future<List<ItemOcorrencia>> _getItemOcorrencia() async {
    var url = '';
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    List<ItemOcorrencia> itens = [];
    for (var u in jsonData) {
      ItemOcorrencia itemocorrencia = ItemOcorrencia(
          u["id"], u["tipo"], u["titulo"], u["textodaocorrencia"]);
      itens.add(itemocorrencia);
    }
    print(itens.length);
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
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
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              },
              title: new Text("Início"),
              leading: const Icon(Icons.home),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new ListTile(
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
      body: Container(
        child: FutureBuilder(
          future: _getItemOcorrencia(),
          builder: (BuildContext contex, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Carregando..."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext contex, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].titulo),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => AdicionarOcorrencias()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
