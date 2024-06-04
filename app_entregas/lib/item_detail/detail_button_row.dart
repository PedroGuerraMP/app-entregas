import 'package:flutter/material.dart';

class DetailButtonRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailButtonRowState();
  int numberItems = 0;
}

class _DetailButtonRowState extends State<DetailButtonRow> {
  final TextEditingController _controllerSelectedItems = TextEditingController(text: "1");
  final TextEditingController _controllerBag = TextEditingController(text: "1");

  @override
  void dispose() {
    _controllerSelectedItems.dispose();
    _controllerBag.dispose();
    super.dispose();
  }

  void increment(bool positive) {
    int newValue = int.parse(_controllerSelectedItems.value.text);

    if (int.tryParse(_controllerSelectedItems.value.text)! > 0) {
      positive ? newValue++ : newValue--;
      _controllerSelectedItems.value = TextEditingValue(text: newValue.toString());
    }
    else{
      _controllerSelectedItems.value = const TextEditingValue(text: "1");
    }
    setState(() {});
  }

  void add(){
    int bagValue = int.parse(_controllerBag.value.text);
    int addedValues = int.parse(_controllerSelectedItems.value.text);

    if (int.tryParse(_controllerSelectedItems.value.text)! > 0) {
      _controllerBag.value = TextEditingValue(text: (bagValue + addedValues).toString());
    }
    else {
      _controllerSelectedItems.value = const TextEditingValue(text: "1");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 8,
            child: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                increment(false);
              },
            )
          ),
          Flexible(
            flex: 20,
            child: TextField(
              controller: _controllerSelectedItems,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Flexible(
            flex: 8,
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                increment(true);
              },
            )
          ),
          Flexible(
            flex: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  "Adicionar"),
              onPressed: () {add();},
            )
          ),
          Flexible(
            flex: 12,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.purple),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ))),
                  icon: const Icon(
                    Icons.shopping_bag_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () => {},
                ),
                Card(
                  color: Colors.redAccent,
                  shape: const CircleBorder(),
                  elevation: 0,
                  child: Text(
                    _controllerBag.text,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
