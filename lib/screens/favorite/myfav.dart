import 'package:flutter/material.dart';
import 'package:provide1state/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({Key? key}) : super(key: key);

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    final favouriteItem = Provider.of<FavouriteItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Favourite")),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyFavourite()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 28,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteItem.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItem>(
                    builder: (context, value, child) => ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item' + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline_outlined),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
