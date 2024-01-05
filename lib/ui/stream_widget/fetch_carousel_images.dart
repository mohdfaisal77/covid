import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

Widget fetchCarouselImages() {
  return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('carousel-slider').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        List<String> carouselImages = [];
        for (final doc in snapshot.data!.docs) {
          Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
          carouselImages.add(map["img-path"] as String);
        }
        return ProductCarousel(carouselImages: carouselImages);
      });
}

class ProductCarousel extends StatefulWidget {
  final List<String> carouselImages;

  const ProductCarousel({super.key, required this.carouselImages});

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  var _dotPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: CarouselSlider(
            items: widget.carouselImages
                .map((item) => Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.fitWidth)),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (val, carouselPageChangedReason) {
                  setState(() {});
                }),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DotsIndicator(
          dotsCount: widget.carouselImages.isEmpty ? 1 : widget.carouselImages.
          length,
          position: _dotPosition.toInt(),

    decorator: DotsDecorator(
              activeColor: Colors.orangeAccent,
              color: Colors.orangeAccent.withOpacity(0.5),
              spacing: EdgeInsets.all(2),
              activeSize: Size(8, 8),
              size: Size(6, 6)),
        )
      ],
    );
  }
}
