import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.black),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontSize: 28.0),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
          )
        ],
      ),
      body: Stack(
        children: [_firstList(), _secondList(context), _bottomMenu(context)],
      ),
    );
  }
}

_bottomMenu(context) {
  final Size size = MediaQuery.of(context).size;
  return Stack(
    children: [
      Positioned(
        bottom: 0,
        left: 0,
        child: Stack(clipBehavior: Clip.none, children: [
          CustomPaint(
            size: Size(size.width, 120),
            painter: MenuPainter(),
          ),
          Container(
            width: size.width,
            height: 100,
            color: Colors.black.withOpacity(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    print("selected home");
                  },
                  splashColor: Colors.yellow,
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    print("selected search");
                  },
                  splashColor: Colors.yellow,
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    print("selected user");
                  },
                  splashColor: Colors.yellow,
                ),
              ],
            ),
          ),
        ]),
      ),
    ],
  );
}

_firstList() {
  return Container(
    height: 150,
    padding: EdgeInsets.only(top: 30.0),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          width: 35,
        ),
        _firstListCard(
            "https://cdn.shopify.com/s/files/1/0481/4608/8103/products/s-l1600_grande.png?v=1600307917"),
        SizedBox(
          width: 35,
        ),
        _firstListCard(
            "https://cdn.shopify.com/s/files/1/0481/4608/8103/products/s-l1600_grande.png?v=1600307917"),
        SizedBox(
          width: 35,
        ),
        _firstListCard(
            "https://cdn.shopify.com/s/files/1/0481/4608/8103/products/s-l1600_grande.png?v=1600307917"),
      ],
    ),
  );
}

_firstListCard(image) {
  return Container(
    width: 250,
    height: 120,
    padding: EdgeInsets.only(left: 0.0, right: 20.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          image,
          width: 100.0,
          height: 200.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New Arrivals",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 15),
                ),
              ),
              onPressed: () {},
              child: const Text('Shop now'),
            ),
          ],
        )
      ],
    ),
  );
}

_secondList(context) {
  double size = MediaQuery.of(context).size.width;
  return Positioned(
    top: 200,
    child: Container(
      height: 550,
      padding: EdgeInsets.only(top: 30.0),
      color: Colors.grey[100],
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
        ),
        width: size,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Suggested"),
                Text("SEE ALL >"),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.only(top: 20, bottom: 20.0),
              height: 400.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  _secondListCard("Iphone 12",
                      "https://tienda.movistar.com.mx/media/catalog/product/cache/087d8656b93b378449aad7de37c3d04e/i/p/iphone-12-mini-negro-dual.png"),
                  SizedBox(
                    width: 35,
                  ),
                  _secondListCard("Macbooks",
                      "https://www.apple.com/v/macbook-pro-13/f/images/specs/mbp_shop__fn4wvksqg5aq_large_2x.png"),
                  SizedBox(
                    width: 35,
                  ),
                  _secondListCard("Others",
                      "https://cdn.shopify.com/s/files/1/0481/4608/8103/products/s-l1600_grande.png?v=1600307917"),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

_secondListCard(label, image) {
  return Container(
    width: 250,
    height: 120,
    padding: EdgeInsets.only(left: 0.0, right: 20.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          image,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 15),
            ),
          ),
          onPressed: () {},
          child: const Text('Shop now'),
        ),
      ],
    ),
  );
}

class MenuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
