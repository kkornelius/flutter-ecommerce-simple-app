import 'package:flutter/material.dart';
import 'package:simple_ecommerce/page/login_page.dart';

class HeaderParts extends StatefulWidget {
  const HeaderParts({super.key});

  @override
  State<HeaderParts> createState() => _HeaderPartsState();
}

class _HeaderPartsState extends State<HeaderParts> {
  int indexCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topHeader(),
        const SizedBox(
          height: 30,
        ),
        title(),
        const SizedBox(
          height: 21,
        ),
        searchBar(),
        const SizedBox(
          height: 30,
        ),
        categorySelection(),
      ],
    );
  }

  Padding categorySelection() {
    List<String> list = ["Devices",];
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  indexCategory = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 10,
                  ),
                  child: Text(
                    list[index],
                    style: TextStyle(
                      fontSize: 20,
                      color: indexCategory == index ? Colors.white : Colors.white,
                      fontWeight: indexCategory == index ? FontWeight.bold : null,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container searchBar() {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
                hintText: "Find out",
                hintStyle: TextStyle(color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding title() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to Ipox",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Poppins"
            ),
          ),
          Text(
            "Find your devices",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
                fontFamily: "Poppins"
            ),
          ),
        ],
      ),
    );
  }

  Padding topHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          // For menu
          Material(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          // For location and icon
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white70,
                size: 18,
              ),
              const SizedBox(width: 4),
              const Text(
                "Yerusalem",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Konfirmasi Logout"),
                    content: Text("Apakah Anda yakin ingin logout?"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Tidak"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },
                      ),
                      TextButton(
                        child: Text("Iya"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
