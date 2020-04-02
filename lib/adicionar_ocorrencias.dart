import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/models/itemocorrencia.dart';

class AdicionarOcorrencias extends StatefulWidget {
  @override
  _AdicionarOcorrenciasState createState() => _AdicionarOcorrenciasState();
}

class _AdicionarOcorrenciasState extends State<AdicionarOcorrencias> {
  final TextEditingController _controladorTipo = TextEditingController();
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorTextoDaOcorrencia =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Criar Ocorrência"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controladorTipo,
            decoration: InputDecoration(
              hintText: 'Informe o Tipo',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextField(
              controller: _controladorTitulo,
              decoration: InputDecoration(
                hintText: 'Informe o Título',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextField(
              controller: _controladorTextoDaOcorrencia,
              decoration: InputDecoration(
                hintText: 'Digite a ocorrência',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
          ),
          RaisedButton(
            child: Text('Criar'),
            onPressed: () {
              final String tipo = _controladorTipo.text;
              final String titulo = _controladorTitulo.text;
              final String textodaocorrencia =
                  _controladorTextoDaOcorrencia.text;

              //  final ItemOcorrencia itemocorrenciaNovo =
              //   ItemOcorrencia(tipo, titulo, textodaocorrencia);
              //  print(itemocorrenciaNovo);
            },
          ),
        ],
      ),
    );
  }
}

class BuscarInformacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
