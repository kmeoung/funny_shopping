import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  final int itemId;
  final String itemName;

  ItemDetailScreen({this.itemId, this.itemName, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          itemName,
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
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    color: Theme.of(context).accentColor,
                    width: 400,
                    height: 400,
                    alignment: Alignment.center,
                    child: Text(
                      '$itemName',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Text(
                  '$itemName',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '남은 개수 5/5',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    color: Theme.of(context).accentColor,
                    height: 800,
                    alignment: Alignment.center,
                    child: Text(
                      '아이템 설명',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(-10, -10),
                ),
              ],
              color: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  child: Text(
                    '구매하기',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  child: Text(
                    '장바구니에 담기',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
