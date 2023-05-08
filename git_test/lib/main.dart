import 'package:flutter/material.dart';

void main()=>runApp(
  MaterialApp(
  theme: ThemeData(
    primaryColor: Color(0xFF12a644)
  ),
  home: myapp(),
  debugShowCheckedModeBanner: false,
  )
);
class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  double _height=170.0;
  double _weight=75.0;
  int _bmi=0;
  String _condition='select data';
  @override
 
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(

            padding: EdgeInsets.symmetric(vertical: 40.0 ,horizontal: 10.0),
            height: size.height*0.33,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xFF12a644)),
          
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            Text("BMI" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60.0),),
            Text("Colculator" , style:  TextStyle(color: Colors.white,fontSize: 40.0),),
            SizedBox(

          width: double.infinity,
          child: Container(
            child: Text("$_bmi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60.0),
            textAlign: TextAlign.right,),
          ),    
            ),
            RichText(text: TextSpan(
              text: "condition:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "$_condition",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,fontWeight: FontWeight.bold,
                  )
                )
              ]
            )
            )

          ]),
          
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: size.height*0.03,),
              Text("choose data",
              style:TextStyle(color: Color(0xFF12a644),fontSize: 30.0,fontWeight: FontWeight.bold,),),

               SizedBox(height: size.height*0.10,),
              RichText(text:
                TextSpan(
                text: "Height|:",
                style: TextStyle(color: Color(0xFF403F3d),fontSize: 25.0),
                children: <TextSpan>[
                  TextSpan(
                    text: "$_height cm",
                    style: TextStyle(
                      color: Color(0xFF403F3d),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ]
                


              )),
              Slider(value: _height,
              min: 0,
              max: 250,
              
               onChanged: (height){
                setState(() {
                  _height=height;
                });
               },
               divisions: 250,
               label:"$_height" ,
               activeColor: Color(0xFF403F3d),
               inactiveColor: Colors.grey,
               ),
            


              SizedBox(height: size.height*0.10,),
              RichText(text: TextSpan(
                text: "weight",
                style: TextStyle(color: Color(0xFF403F3d),
                fontSize: 25.0),
                children: <TextSpan>[
                  TextSpan(
                    text: "$_weight kg ",
                    style: TextStyle(color: Color(0xFF403F3d),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold)
                  )
                ]
              )),
                Slider(value: _weight,
              min: 0,
              max: 250,
              
               onChanged: (Weight){
                setState(() {
                  _weight=Weight;
                });
               },
               divisions: 250,
               label:"$_weight" ,
               activeColor: Color(0xFF403F3d),
               inactiveColor: Colors.grey,
               ),
            
             SizedBox(height: size.height*0.05,),
             Container(
              width: size.width*0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child:FilledButton(
                  onPressed:(){
                    setState(() {
                      _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
                      if(_bmi>=18.5 &&_bmi<=25){_condition="normal";}
                      else if (_bmi>25 && _bmi<30){_condition="overweight";}
                      else if (_bmi>30){_condition="obesity";}
                      else{_condition ="underweight";}
                    });
                  } ,
                  child:Text("calculate",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  
                  
                  
                  ),
              ),
             )
            
            ]),
          )

        ]),
      ),
    );
  }
}