import 'package:flutter/material.dart';
import 'package:simple_ecommerce/model/items_model.dart';
import 'package:simple_ecommerce/screen/items_details.dart';
import 'package:simple_ecommerce/utils/colors.dart';

class ItemsDisplay extends StatefulWidget {
  const ItemsDisplay({Key? key});

  @override
  State<ItemsDisplay> createState() => _ItemsDisplayState();
}

class _ItemsDisplayState extends State<ItemsDisplay> {
@override
Widget build(BuildContext context) {
  return GridView.builder(
    shrinkWrap: true,
    itemCount: phoneItems.length,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      mainAxisExtent: 265,
    ),
    itemBuilder: (context, index) {
      final phone = phoneItems[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(phone: phone),
            ),
          );
        },
        child: Container(
          height: 265,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(125),
                      child: Image.network(
                        phone.image,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      phone.name,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          phone.rate.toString(),
                          style: const TextStyle(color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '\$${phone.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 150, top: 10),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.black45,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  color: primaryColors, // Pastikan primaryColors didefinisikan
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
}
