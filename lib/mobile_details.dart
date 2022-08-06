import 'package:flutter/material.dart';
import 'package:practical_exam/model/detail.dart';
import 'package:practical_exam/services/api_service.dart';

import 'model/data.dart';

class MyDetail extends StatelessWidget {
  const MyDetail({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyMobileDetails(),
    );
  }
}

class MyMobileDetails extends StatefulWidget {
  const MyMobileDetails({Key? key}) : super(key: key);

  @override
  State<MyMobileDetails> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyMobileDetails> {
  ApiService2 apiService = ApiService2();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Details"),
      ),
      body: FutureBuilder(
        future: apiService.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Details>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: [
                    Padding(padding: EdgeInsets.all(20),
                      child:GestureDetector(
                        onTap: (){},
                        child: Image.network('${snapshot.data![index].mobile_image}'),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text('${snapshot.data![index].name}' + " "'${snapshot.data![index].company}'),
                        subtitle: Text('${snapshot.data![index].description}'),
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

