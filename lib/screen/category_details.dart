import 'package:fastival/services/remote_services.dart';
import 'package:flutter/material.dart';

import '../model/category_details_model.dart';

class CategoryDetails extends StatefulWidget {
  final int cate_id;
   CategoryDetails({Key? key , required this.cate_id}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("CategoryDetails" , style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder<List<CategoryDetailsModel>?>(
        future: RemoteServices().getCategoryDetails(widget.cate_id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<CategoryDetailsModel> data = snapshot.data;
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            data[index].cateDeImUrl,
                            height: 200,
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data[index].cateDeImageName,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: Text("${snapshot.error}"),
          );
        },
      )
      ,
    );
  }
}
