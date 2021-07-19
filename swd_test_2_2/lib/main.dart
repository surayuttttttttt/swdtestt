import 'package:flutter/material.dart';

void main() =>
    runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {


  @override
  _CalculatorState createState() => _CalculatorState();
}



class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  Widget calcbutton(String btntxt,Color btncolor,Color txtcolor){
    return Container(
      child: RaisedButton(
        onPressed: (){
          calculation(btntxt);
        },
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),

    );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:Text('Calculator by Surayut'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:<Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0),
                    child:Text('$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 230,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(34, 20, 120, 20),
                    onPressed: (){
                      calculation('AC');
                    },
                    shape: StadiumBorder(
                    ),
                    child: Text('Clear All',style: TextStyle(
                        fontSize: 35,color: Colors.white
                    ),
                    ),
                    color: Colors.blueGrey,
                  ),
                ),
                calcbutton('/', Colors.orange,Colors.white ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                calcbutton('7', Colors.blueGrey,Colors.white ),
                calcbutton('8', Colors.blueGrey,Colors.white ),
                calcbutton('9', Colors.blueGrey,Colors.white ),
                calcbutton('x', Colors.orange,Colors.white ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                calcbutton('4', Colors.blueGrey,Colors.white ),
                calcbutton('5', Colors.blueGrey,Colors.white ),
                calcbutton('6', Colors.blueGrey,Colors.white ),
                calcbutton('-', Colors.orange,Colors.white ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.blueGrey,Colors.white ),
                calcbutton('2', Colors.blueGrey,Colors.white ),
                calcbutton('3', Colors.blueGrey,Colors.white ),
                calcbutton('+', Colors.orange,Colors.white ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: (){
                    calculation('0');
                  },
                  shape: StadiumBorder(),
                  child: Text('0',style: TextStyle(
                      fontSize: 35,color: Colors.white
                  ),
                  ),
                  color: Colors.blueGrey,
                ),
                calcbutton('.', Colors.blueGrey,Colors.white ),
                calcbutton('=', Colors.orange,Colors.white ),
              ],
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  dynamic text ='0';
  double x = 0;
  double y = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      x = 0;
      y = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(x == 0) {
        x = double.parse(result);
      } else {
        y = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (x + y).toString();
    x = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (x - y).toString();
    x = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (x * y).toString();
    x = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (x / y).toString();
    x = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }


}









