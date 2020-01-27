import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // Color appCor = Colors.blueGrey.shade200;
  // Color appCor = Colors.grey.shade200;
  // Color appCor = Colors.red;
  // Color appCor = Colors.blue;
  // Color appCor = Colors.yellow;
  // Color appCor = Colors.green;
  // Color appCor = Colors.black;
  // Color appCor = Color.fromARGB(255, 28, 28, 28);
  Color appCor = Color.fromARGB(255, 241, 242, 244);

  Color fontColor = Colors.black;
  Color fontColor2 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: appCor,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 7, bottom: 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NeoContainer(
                      color: appCor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.arrow_back, color: fontColor,),
                      ),
                    ),
                    NeoContainer(
                      color: appCor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.menu, color: fontColor,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hi Zain,",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold, color: fontColor,
                      ),
                    ),
                    Divider(),
                    Text(
                      "What would you like to have, we're offering some services",
                      style: TextStyle(
                        fontSize: 22,
                        color: fontColor2
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // borderSide: BorderSide(
                        // style: BorderStyle.solid,
                        // color: Color.fromARGB(255, 159, 159, 161),
                        // width: 10
                      // )
                    ),
                    suffixIcon: Icon(Icons.search),
                    hintText: "Find your symptons",
                    hintStyle: TextStyle(
                      color: fontColor2,
                      fontSize: 20
                    )
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    childAspectRatio: 1.21
                  ),
                  itemCount: 4,
                  itemBuilder: (context, i){
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      child: NeoContainer( 
                        color: appCor, 
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Icon(Icons.people, size: 40, color: fontColor,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Option",
                                style: TextStyle(
                                  fontSize: 20, color: fontColor,
                                ),
                              ),
                            )
                          ],
                        ), 
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: NeoContainer(
                  color: appCor,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.exit_to_app, color: fontColor, size: 50,),
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 20, color: fontColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NeoContainer extends StatelessWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeoContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(bevel),
            color: this.color,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.lerp(this.color, Colors.black, .03),
                color,
                color,
                Color.lerp(this.color, Colors.white, .09),
              ],
              stops: [ 0.0, .3, .6, 1.0, ]
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: bevel,
                offset: -Offset(bevel / 2, bevel / 2),
                spreadRadius: -6,
                color: Color.lerp(this.color.withOpacity(0.1), Colors.white, .6),
              ),
              BoxShadow(
                blurRadius: bevel,
                offset: -Offset(bevel / -2, bevel / -2),
                color: Color.lerp(this.color.withOpacity(0.1), Colors.black, .2),
              ),            
            ]),
        child: child,
      ),
    );
  }
}
