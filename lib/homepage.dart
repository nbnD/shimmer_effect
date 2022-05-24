import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_example/provider/getdata_provider.dart';
import 'package:shimmer_example/utils/shimmer_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<GetDataProvider>(context, listen: false);
    dataProvider.getMyData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<GetDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer Effect"),
      ),
      body: dataProvider.isLoading
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (ctx,i){
              return Column(
                children: [
                  loadingShimmer(),
                  const SizedBox(height: 10,)
                ],
              );
            }),
          )
          : ListView.builder(
              shrinkWrap: true,
              itemCount:  dataProvider.responseData.data!.length,
              itemBuilder: (ctx, i) {
                return Card(
                    
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.network(dataProvider.responseData.data![i].avatar!,height:150,width: 100,),
                          Column(
                            children: [
                              Text(dataProvider.responseData.data![i].email!)
                            ],
                          ),
                        ],
                      ),
                    ));
              }),
    );
  }
}
