import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:menufy_login_form/models/restaurant_item.dart';
import 'package:menufy_login_form/providers/dummy.dart';
import 'package:menufy_login_form/widgets/restaurant_widget.dart';
import '../providers/offer_slider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  
  static const routeName = '/home';
  List<RestaurantItem> results=[];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images =
        Provider.of<OfferSlider>(context, listen: true).offers;
    List<RestaurantItem> dummyRes =
        Provider.of<DummyRes>(context, listen: true).dummyRes;
  //results=dummyRes;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "menufy_login_form",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Ink(
              child: InkWell(
                //borderRadius: BorderRadius.circular(50),
                onTap: () {
                  print("Hello");
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: TextField(
              
              onChanged: (value) {
                if (value.isEmpty) {
                  print(value);
                  // if the search field is empty or only contains white-space, we'll display all
                  results = dummyRes;
                } else {
                  print(value);
                  results = Provider.of<DummyRes>(context, listen: false).search(value);
                  // for(int i=0;i<dummyRes.length;i++)
                  // {print(dummyRes[i].name);}
                  print(results.length);
                  // we use the toLowerCase() method to make it case-insensitive
                }
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                hintText: "Select restaurant",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(height: 200.0),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: FittedBox(fit: BoxFit.fill, child: Image.network(i)),
                  );
                },
              );
            }).toList(),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
            itemBuilder: (ctx, index) {
              return RestaurantWidget(
                id: results[index].id,
                imageUrl: results[index].imageUrl,
                name: results[index].name,
                type: results[index].type,
                rating: results[index].rating,
              );
            },
          ),
        ]),
      ),
    );
  }
}
