//main.dart
import 'package:flutter/material.dart';
import 'Jogar.dart';

void main() {
  runApp(MaterialApp(
    home: Jogar(),
    debugShowCheckedModeBanner: false,
  ));
}

//Jogar.dart
import 'package:cara_ou_coroa/Resultado.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogar extends StatefulWidget {
  const Jogar({Key? key}) : super(key: key);

  @override
  _JogarState createState() => _JogarState();
}

class _JogarState extends State<Jogar> {
  
  void _exibirResultado(){

    var itens = ["cara", "coroa"];
    var numero = Random().nextInt(itens.length);
    var resultado = itens[numero];

    Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => Resultado(resultado)
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61db86),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("imagens/logo.png"),
            GestureDetector(
              onTap: _exibirResultado,
              child: Image.asset("imagens/botao_jogar.png"),
            )
          ],
        ),
      )
    );
  }
}


//Resultado.dart
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {

  String valor="";
  Resultado(this.valor);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {

    //print(widget.valor);
    var caminhoImagem = "";
    if( widget.valor == "cara" ){
      caminhoImagem = "imagens/moeda_cara.png";
    }else{
      caminhoImagem = "imagens/moeda_coroa.png";
    }

    return Scaffold(
        backgroundColor: Color(0xff61db86),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(caminhoImagem),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset("imagens/botao_voltar.png"),
              )
            ],
          ),
        )
    );
  }
}
