import 'package:flutter/material.dart';
import 'package:flutter_practice_app/model/Food.dart';

class FoodieDetails extends StatefulWidget {
  String tagImage;
  Food food;

  FoodieDetails(this.tagImage, this.food);

  @override
  FoodieDetailsState createState() => FoodieDetailsState();
}

class FoodieDetailsState extends State<FoodieDetails> {
  Size _mediaQuerySize;
  double imageSize = 240.0;
  var selectedCard = 'WEIGHT';
  int _itemCartCounter = 0;
  double _totalCart = 0;
  double _contentOpacity = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _mediaQuerySize = MediaQuery.of(context).size;
    Future.delayed(const Duration(microseconds: 100), () {
      setState(() {
        _contentOpacity = 1.0;
      });
    });

    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            'Details',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_horiz),
                color: Colors.white,
                onPressed: () {})
          ],
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: _mediaQuerySize.height - 80,
                  width: _mediaQuerySize.width,
                  color: Colors.transparent,
                ),
                Positioned(
                  top: 72.0,
                  height: _mediaQuerySize.height - 100,
                  width: _mediaQuerySize.width,
                  child: Hero(
                    tag: 'card',
                    child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(72.0),
                          topRight: Radius.circular(72.0),
                        ),
                      ),
                      elevation: 4,
                    ),
                  ),
                ),
                Positioned(
                  top: 16.0,
                  left: (_mediaQuerySize.width / 2) - (imageSize / 2),
                  child: Hero(
                    tag: widget.tagImage,
                    child: Image(
                      image: AssetImage(widget.food.image),
                      fit: BoxFit.cover,
                      height: imageSize,
                      width: imageSize,
                    ),
                  ),
                ),
                Positioned(
                  top: 256.0,
                  width: _mediaQuerySize.width,
                  child: AnimatedOpacity(
                    opacity: _contentOpacity,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.food.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "\₹ " + widget.food.price.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                              Container(
                                height: 24.0,
                                width: 1.0,
                                color: Colors.grey,
                              ),
                              Container(
                                width: 120.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  color: Color(0xFF7A9BEE),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        _removeCart();
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '$_itemCartCounter',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _addCart();
                                      },
                                      child: Container(
                                        height: 24.0,
                                        width: 24.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Color(0xFF7A9BEE),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Container(
                            height: 148.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                _buildInfoCard('WEIGHT', '300', 'G'),
                                SizedBox(width: 10.0),
                                _buildInfoCard('CALORIES', '267', 'CAL'),
                                SizedBox(width: 10.0),
                                _buildInfoCard('VITAMINS', 'A, B6', 'VIT'),
                                SizedBox(width: 10.0),
                                _buildInfoCard('AVAIL', 'NO', 'AV')
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 16.0),
                          child: Container(
                            height: 54.0,
                            width: _mediaQuerySize.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '\₹ $_totalCart',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        setSelected(cardTitle);
      },
      child: AnimatedContainer(
        height: 100.0,
        width: 100.0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: cardTitle == selectedCard
                ? Colors.transparent
                : Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 0.75,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0),
              child: Text(cardTitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: cardTitle == selectedCard
                        ? Colors.white
                        : Colors.grey.withOpacity(0.7),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(info,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(unit,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: cardTitle == selectedCard
                            ? Colors.white
                            : Colors.black,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void setSelected(String cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }

  void _removeCart() {
    if (_itemCartCounter > 0)
      setState(() {
        _itemCartCounter--;
        _updateTotal();
      });
  }

  void _addCart() {
    setState(() {
      _itemCartCounter++;
      _updateTotal();
    });
  }

  void _updateTotal() {
    setState(() {
      _totalCart = _itemCartCounter * widget.food.price;
    });
  }
}
