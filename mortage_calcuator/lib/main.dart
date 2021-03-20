import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeUI(),
  ));
}

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _counter =1;
  int _percentage =0;
  double homeamount =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mortage Calculator"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(58.0),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Monthly Payment"),
                      ),
                      Text("\$ ${calculateMonthMortage(homeamount, _counter, _percentage)}")
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.blueGrey.shade100,
                style: BorderStyle.solid
              ),
              borderRadius: BorderRadius.circular(12.0)
            ),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    prefixText: "Home Price ",
                    prefixIcon: Icon(Icons.home),
                    prefixStyle: TextStyle(color: Colors.blue)
                  ),
                  onChanged: (String value){
                      try{
                        homeamount = double.parse(value);
                      }catch(exception){

                      }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Length of Loan (Years)",
                    style: TextStyle(color: Colors.black)
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              if(_counter > 1){
                                _counter--;
                              }else{
                                //Do Nothing
                              }

                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.grey.shade300
                            ),
                            child: Center(
                              child: Text("-",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                              ),),

                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 20.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text("$_counter"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              _counter++;
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.grey.shade300
                            ),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(
                        "Interest",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,right: 8.0),
                      child: Text("$_percentage%",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],

                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Slider(
                        min: 0,
                          max: 10,
                          activeColor: Colors.deepOrange,
                          inactiveColor: Colors.grey,
                          value: _percentage.toDouble(),
                          onChanged: (double value){
                        setState(() {
                          _percentage = value.round();
                        });

                      }),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

calculateMonthMortage(double _amount,int _length,int _percentage){
  double interest;
  if(_amount < 0 || _amount.toString().isEmpty || _amount == null){
    //Do nothing
  }else{
    interest = (_amount * _percentage) /100;
    debugPrint("$interest");
  }
  var allMonth = _length * 12;
  debugPrint("$allMonth");
  var total = (_amount + interest)/allMonth;
  return total.toStringAsFixed(2);


}