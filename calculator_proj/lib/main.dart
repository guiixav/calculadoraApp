//import 'dart:html';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter exercise ex02',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code cExpanded(hanges can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade200),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String valorCampoTextoEntrada = '0';
  String valorCampoTextoResultado = '0';
  num resultadoNumerico = 0;

  void alteraValorString(String valor){
    String ultimoDigito = valorCampoTextoEntrada.substring(valorCampoTextoEntrada.length -1);
    debugPrint(ultimoDigito);
    setState(() {
    
    if(valor == '/' && valorCampoTextoEntrada == '0'|| valor == 'x' && valorCampoTextoEntrada == '0' || valor == '.' && valorCampoTextoEntrada == '0')
      {
        valorCampoTextoEntrada = valorCampoTextoEntrada;
      }
    else if(valorCampoTextoEntrada == '0' || valorCampoTextoEntrada == 'Error')
      {
        valorCampoTextoEntrada = valor;
      }
    else if((valor == '+' || valor == '-' || valor == '*' || valor == '/' || valor == '.') 
              && (ultimoDigito == '+' || ultimoDigito == '-' || ultimoDigito == '*' || ultimoDigito == '/' || ultimoDigito =='.'))
      {
        
        valorCampoTextoEntrada = valorCampoTextoEntrada.substring(0, valorCampoTextoEntrada.length - 1);
        valorCampoTextoEntrada += valor;
      }
    else{
        valorCampoTextoEntrada += valor;
      }
    executaCalculo(valor);
    });
  }

  void limpaString(){
    setState(() {
      valorCampoTextoEntrada = '0';
      resultadoNumerico = 0;
      valorCampoTextoResultado = '0';
    });
  }
  void limpaCalculo(){
    setState(() {
      valorCampoTextoEntrada = '0';
      resultadoNumerico = 0;    
 
       
    });
  }
  void limpaUltimoCaracterDigitado(){
    setState(() {
      if(valorCampoTextoEntrada != '0' && valorCampoTextoEntrada.length > 1)
      {
      valorCampoTextoEntrada = valorCampoTextoEntrada.substring(0, valorCampoTextoEntrada.length - 1);
      }
      else if(valorCampoTextoEntrada.length == 1)
      {
        valorCampoTextoEntrada = '0';
      }
    });
  }

  void executaCalculo(String valor)
  {
    if(valor == '+' || valor == '-' || valor == '*' || valor == '/' || valor == '.'){
      debugPrint('Expressão com simbolo na ultima posição da string');
    }
    else if(valorCampoTextoEntrada.length > 2 && valorCampoTextoEntrada.substring(valorCampoTextoEntrada.length - 2) == '/0'){
      valorCampoTextoResultado = 'Error: Divisão por Zero';
      limpaCalculo();
    } 
    else{
    resultadoNumerico = valorCampoTextoEntrada.interpret();
      valorCampoTextoResultado = resultadoNumerico.toString();}
    }
  

  
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [

                Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                  ),
                  child: TextField( decoration: InputDecoration(
                    hintText: valorCampoTextoEntrada,
                    enabled: false
                    ),
                    textAlign: TextAlign.right
                  ),
                ),
              

                Container(

                  decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                    ),
                    child: TextField( decoration: InputDecoration(
                        hintText: valorCampoTextoResultado,
                        enabled: false
                      ),

                      textAlign: TextAlign.right
                    ),
                ),
            Row(
              children:
              <Widget>[
                Expanded( 
                child: TextButton(
                  onPressed: () {alteraValorString('7');debugPrint('7');} , child: const Text('7'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('8');debugPrint('8');} , child: const Text('8'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('9'); debugPrint('9');} , child: const Text('9'))),
                Expanded(
                child: TextButton(onPressed: () {limpaUltimoCaracterDigitado(); debugPrint('Limpando Ultimo Caracter Digitado');} , child: const Text('C'))),
                Expanded(
                child: TextButton(onPressed: () {limpaString(); debugPrint('Limpa Tudo');} , child: const Text('AC')))
              ],
            ),
            Row(
              children: <Widget>[ Expanded(
                child: TextButton( onPressed: () {alteraValorString('4');debugPrint('4');} , child: const Text('4'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('5');debugPrint('5');} , child: const Text('5'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('6');debugPrint('6');} , child: const Text('6'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('+');debugPrint('+');} , child: const Text('+'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('-');debugPrint('-');} , child: const Text('-')))
              ],
            ),
            Row(
              children: <Widget>[ Expanded(
                child: TextButton( onPressed: () {alteraValorString('1');debugPrint('1');} , child: const Text('1'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('2');debugPrint('2');} , child: const Text('2'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('3');debugPrint('3');} , child: const Text('3'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('*');debugPrint('x');} , child: const Text('x'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('/');debugPrint('/');} , child: const Text('/')))
              ],
            ),
            Row(
              children: <Widget>[ Expanded(
                child: TextButton( onPressed: () {alteraValorString('0');debugPrint('0');} , child: const Text('0'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('.');debugPrint('.');} , child: const Text('.'))),
                Expanded(
                child: TextButton(onPressed: () {alteraValorString('00');debugPrint('00');} , child: const Text('00'))),
                Expanded(
                child: TextButton(onPressed: () {limpaCalculo();debugPrint('=');} , child: const Text('='))),
                Expanded(
                child: TextButton(onPressed: () {} , child: const Text('')))
              ],
            ) 
          ]
        ),
      ),
    );
  }
}
