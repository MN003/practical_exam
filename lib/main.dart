import 'package:flutter/material.dart';
import 'package:practical_exam/mobile_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mobile App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 230, 230, 255),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                // color: Colors.black,
                child: Column(
                  children: [
                    const Text("Sign In", style: TextStyle(
                      fontSize: 30,
                      color : Color.fromARGB(255, 105, 169, 228,),
                      fontWeight: FontWeight.bold,
                    ),),
                    // Image.asset('images/DBZ-09.jpg'),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 12, 20),
                      child: TextFormField(
                        validator: (value){
                          if(value!.length == 10){
                            // return "Enter valid mobile number";
                            return "Valid";
                          }
                          else{
                            return "Enter valid mobile number";
                          }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          label: Text("Mobile No"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyList()),
                          );
                          if(formKey.currentState!.validate()){
                            print("Success");
                          }
                          else{
                            print("Failed");
                          }
                        },
                        child: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
