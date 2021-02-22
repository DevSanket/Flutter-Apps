import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: tipCalc(),
  ));
}

class tipCalc extends StatefulWidget {
  @override
  _tipCalcState createState() => _tipCalcState();
}

class _tipCalcState extends State<tipCalc> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade100,
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text("Total Per Person - "),
                    ),
                    Text("\$ ${calculateTotalPerson(_billAmount, _personCounter)}",style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                    ),)
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey.shade700,style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount - ",
                      prefixIcon: Icon(Icons.attach_money)
                    ),
                    onChanged: (String value){
                     try{
                       _billAmount = double.parse(value);
                     }catch(exception){
                       _billAmount =0.0;
                     }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Split",style: TextStyle(
                          color: Colors.black
                        ),),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if(_personCounter > 1){
                                    _personCounter--;
                                  }
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.lightBlue.shade100
                                ),
                                child: Center(
                                  child: Text("-" , style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 30
                                  ),),
                                ),
                              ),
                            ),
                            Text("$_personCounter",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _personCounter++;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.lightBlue.shade100
                                ),
                                child: Center(
                                  child: Text("+" , style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 30
                                  ),),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip",style: TextStyle(color: Colors.black),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("\$ ${(calculateTotalTip(_billAmount,_personCounter, _tipPercentage)).toStringAsFixed(2)}",style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                  Slider(min: 0,max: 100,divisions: 10,activeColor: Colors.deepPurpleAccent,inactiveColor: Colors.grey,value: _tipPercentage.toDouble(), onChanged: (double newValue){
                    setState(() {
                      _tipPercentage = newValue.round();
                    });
                  })
                ],
              ),
            )
          ],
        ),
      ) ,
    );
  }
  calculateTotalPerson(double billAmount, int split){
    double Total = (billAmount + calculateTotalTip(billAmount, split, _tipPercentage)) /split;
    return Total.toStringAsFixed(2);

  }
  calculateTotalTip(double billAmount,int split,int tipPercentage){
    double totalTip =0.0;
    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null){
      //Nothing to do
    }else{
      totalTip = (billAmount * tipPercentage ) / 100;
    }
    return totalTip;
  }
}
