import 'package:flutter/material.dart';
import 'package:shopping_mall/common_params.dart';
import 'package:shopping_mall/screen/sub_category_screen.dart';

import 'item_detail_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          CommParams.title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {}),
        ],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      drawer: Drawer(
        child: Column(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: ListBody(
                mainAxis: Axis.vertical,
                children: [
                  SizedBox(height: 50),
                  headerWidget(title: 'Categorys'),
                  categorysWidget(context),
                  headerWidget(title: 'TOP 20 Items'),
                  topItemsWidget(context),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          bottomNav(context),
        ],
      ),
    );
  }

  Container topItemsWidget(BuildContext context) {
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

  SizedBox categorysWidget(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return SubCategoryScreen(
                    cateogoryId: index,
                    categoryName: 'Category $index',
                  );
                },
              ),
            );
          },
          child: Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.accents[index % Colors.accents.length],
            ),
            child: Center(
              child: Text(
                'Category $index',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding headerWidget({String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0, top: 30.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container bottomNav(BuildContext context) {
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
}
