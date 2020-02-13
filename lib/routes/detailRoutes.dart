import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/foodModels.dart';

class DetailRoutes extends StatefulWidget {
  final String title;
  final FoodModels item;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final void Function() callback;

  const DetailRoutes({Key key, this.title = "Detail Foods", this.item, this.scaffoldKey, this.callback, }) : super(key: key);

  @override
  _DetailRoutesState createState() => _DetailRoutesState();
}

class _DetailRoutesState extends State<DetailRoutes> with TickerProviderStateMixin {
  TabController _tabController;
  ScaffoldState _scaffoldState;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scaffoldState.showSnackBar(
        SnackBar(
          content: Text("You choose ${widget.item.name}"),
          action: SnackBarAction(
            label: "Go Back",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name == "" ? widget.title : widget.item.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Builder(
        builder: (BuildContext buildContext) {
          _scaffoldState = Scaffold.of(buildContext);

          return SafeArea(
            child: Column(
              children: <Widget>[
                Hero(
                  child: Image.network(widget.item.thumbnail),
                  tag: widget.item.id,
                  createRectTween: (begin, end) {
                    Rect newE = Rect.fromLTRB(end.left, end.top, end.right + 1000, end.bottom);

                    return MaterialRectCenterArcTween(begin: begin, end: newE);
                  },
                ),
                TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text("Materials"),
                    ),
                    Tab(
                      child: Text("Seasonings"),
                    ),
                    Tab(
                      child: Text("How To"),
                    )
                  ],
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.blue,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ListView(
                        children: widget.item.materials.map((s) {
                          return ListTile(
                            dense: true,
                            title: Text(s),
                            leading: Icon(Icons.add),
                          );
                        }).toList(),
                      ),
                      ListView(
                        children: widget.item.seasonings.map((s) {
                          return ListTile(
                            dense: true,
                            title: Text(s),
                            leading: Icon(Icons.add_shopping_cart),
                          );
                        }).toList(),
                      ),
                      ListView(
                        children: widget.item.howTo.map((s) {
                          return ListTile(
                            dense: true,
                            title: Text(s),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}