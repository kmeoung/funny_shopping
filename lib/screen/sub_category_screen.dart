import 'package:flutter/material.dart';
import 'package:shopping_mall/screen/item_detail_screen.dart';

class SubCategoryScreen extends StatelessWidget {
  final int cateogoryId;
  final String categoryName;

  SubCategoryScreen({Key key, this.cateogoryId, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          categoryName,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: [
          bottomNav(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: itemDetail(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container bottomNav() {
  return Container(
    height: 10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50.0),
        bottomRight: Radius.circular(50.0),
      ),
      color: Colors.white,
    ),
  );
}

Container itemDetail(BuildContext context) {
  return Container(
    child: GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 10.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 50 / 40,
      children: List.generate(
        21,
        (index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return ItemDetailScreen(
                    itemId: index,
                    itemName: 'Item $index',
                  );
                },
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.accents[index % Colors.accents.length],
            ),
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
