import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/foodModels.dart';
import 'package:meals_catalogue/routes/detailRoutes.dart';

class GridList extends StatelessWidget {
  final List<FoodModels> foodList;
  final String type;

  GridList(this.foodList, this.type);

  List<Widget> _generateChild(BuildContext context, String type) {
    List<Widget> list = new List();
    List<FoodModels> listFoodByType = foodList.where((e) {
      return e.type == type;
    }).toList();
    for (var m in listFoodByType) {
      list.add(Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailRoutes(
                item: m,
              ),
            ));
          },
          child: GridTile(
            child: ClipRRect(
              child: Hero(
                child: Image.network(m.thumbnail, fit: BoxFit.fill,),
                tag: m.id,
                createRectTween: (begin, end) {
                  Rect newE = Rect.fromLTRB(end.left + 1000, end.top, end.right, end.bottom);

                  return MaterialRectCenterArcTween(begin: begin, end: newE);
                },
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            footer: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(m.name,style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 21, fontFamily: "Serif", color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black38
              ),
            ),
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: _generateChild(context, type),
    );
  }
}