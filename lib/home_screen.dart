import 'package:flutter/material.dart';
import 'package:nike_app/model/dummy_list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  List<DummyListModel> filteredList = DummyListModel.dummyList;

  void searchItem(String text) {
    final query = text.toLowerCase();

    setState(() {
      filteredList = DummyListModel.dummyList.where((item) {
        return item.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nike Home Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextFormField(
              controller: searchTextEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search...',
              ),
              onChanged: searchItem,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: filteredList.isEmpty
                  ? Center(
                      child: Text(
                        'No data found',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final item = filteredList[index];
                        return ListTile(
                          leading: Image.asset(item.image, width: 50),
                          title: Text(item.name),
                          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
