import 'package:flutter/material.dart';
import 'package:practical_exam/mobile_details.dart';
import 'package:practical_exam/services/api_service.dart';

import 'model/data.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyMobileList(),
    );
  }
}

class MyMobileList extends StatefulWidget {
  const MyMobileList({Key? key}) : super(key: key);

  @override
  State<MyMobileList> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyMobileList> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile App"),
      ),
      body: FutureBuilder(
        future: apiService.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: [
                    Padding(padding: EdgeInsets.all(20),
                      child:GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyDetail()),
                          );
                        },
                        child: Image.network('${snapshot.data![index].mobile_image}'),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text('${snapshot.data![index].name}' + " "'${snapshot.data![index].company}'),
                        subtitle: Text('${snapshot.data![index].description}',maxLines: 3,),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

