import 'package:flutter/material.dart';
import 'package:provide1state/providers/favourite_provider.dart';
import 'package:provide1state/screens/favorite/myfav.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    // final favouriteItem = Provider.of<FavouriteItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Favourite")),
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
                itemCount: 40,
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
