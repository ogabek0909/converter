import 'package:flutter/material.dart';
import 'Pages/firstpage.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text1=TextEditingController(text: '');
  TextEditingController text2=TextEditingController(text: '');
  double slider=0;
  double maximium=100;
  int dividerNumber=100;
  double t=0;
  double w=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Tip Calculator',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
      
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text('Bill:',style: TextStyle(fontSize: 25),),flex: 21,),
                  Expanded(
                    flex: 20,
                    child: TextField(
                      controller: text1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(child: Text('Person number:',style: TextStyle(fontSize: 25),),flex: 21,),
                    Expanded(
                      flex: 20,
                      child: TextField(
                        controller: text2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder()
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Tip',style: TextStyle(fontSize: 25)),
                        Text(' (Per Person)')
                      ],
                    ),
                    Text('\$${w*100~/1/100}',style: TextStyle(fontSize: 25))
                  ],
                ),
              ),
              Divider(thickness: 15,color: Colors.grey[700],),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Total',style: TextStyle(fontSize: 25)),
                        Text(' (Per Person)')
                      ],
                    ),
                    Text('\$${t*100~/1/100}',style: TextStyle(fontSize: 25))
                  ],
                ),
      
              ),
              Slider(value: slider, onChanged: (value) {
                setState(() {
                  slider=value;
                });
              },
              // activeColor: Colors.red,
              // thumbColor: Colors.amber,
              // inactiveColor: Colors.lime,
              label: "${slider.floor()}",
              max: maximium,
              divisions: dividerNumber,
              ),
              ElevatedButton(onPressed: (){
                print(slider);
                setState(() {
                  t=double.parse(text1.text);
                  w=((slider/100)*t)/double.parse(text2.text);
                  t=((slider/100+1)*t)/double.parse(text2.text);
                },
                
                );
              }, child: Text('Get Result')),
              
            ],
          ),
        ),
      ),
    );
  }
}