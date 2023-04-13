import 'package:MyMedice/src/constants/sizes.dart';
import 'package:MyMedice/src/features/search/models/medical_model.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class SearchPage extends KFDrawerContent {
  SearchPage({
    Key? key,
  });

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? _textEditingController = TextEditingController();
  List itemsInSearch = [];
  List medicel = [
    ['CETIRIZINE', 'ZYRTEC ', '10mg', 8],
    ['DEXCHLORPHENIRAMINE MALEATE', 'HISTAGAN ', '10mg', 20],
    ['LORATADINE', 'RESTAMINE ', '10mg', 10]
  ];

  List items = [
    'ALERID',
    'ALLERTINE',
    'ANTOR',
    'ACEPRAL',
    'ALUSTAL'
        'BIOFENAC  ',
    'BUFEN'
        'CATALGINE',
    'COMAX',
    'CROFENAC',
    'CORDIPIN RETARD ',
    'DOLOMOL',
    'DOLIPRANE',
    'DICLOFENAC',
    'DICLOREUM',
    'DYCLOMAX'
        'EFFERALGAN',
    'EXPANDOL',
    'EPIFENAC 50',
    'HOTEMIN',
    'FENAMON SR',
    'FLOGOFENAC',
    'FIRMACIN',
    'FORTICAM',
    'FELDENE'
        'GEOFENAC',
    'INFLA-BAN ',
    'INDOMET',
    'INDOMETACINE E,C',
    'INDOCID',
    'JOPAMOL',
    'JAZOFEN',
    'PROFEN',
    'PANAMOR',
    'PHLOGOREN',
    'PROFENID',
    'PROXIDOL'
        'K',
    'KETOPROFENO RATIOPHARM ',
    'KETONAL',
    'KETOFENID',
    'KETOFAN'
        'LCAM ',
    'LOXEN',
    'LOXEN L,P',
    'LORAX'
        'VOLTARENE ',
    'XENID ',
    'XYCAM',
    'NEXORPAN',
    'NAPROXENE SOLUPHARM ',
    'NAREX',
    'NIFECARD',
    'NIFEDIPINE T20 STADA RETARD'
        'SAPOFEN 600 ',
    'SAPOFEN 600 ',
    'SAPOFEN JUNIOR '
  ];

// *----------------------------------------------------
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  //* This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
// *----------------------------------------------------
  // * function for filter our liste
  void updateListe(String value) {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          centerTitle: true,
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            child: Material(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: widget.onMenuPressed,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search For a Medical',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: tDefaultSize - 10,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _foundUsers = _allUsers
                        .where((element) => element['name']
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          itemsInSearch.clear();
                          _textEditingController!.clear();
                          setState(() {
                            _textEditingController!.text = '';
                          });
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.red.withOpacity(0.4),
                        )),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey.shade900,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: tDefaultSize - 10,
              ),
              Expanded(
                  child: _textEditingController!.text.isNotEmpty &&
                          _foundUsers.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.search_off,
                                size: 80,
                                color: Colors.blue,
                              ),
                              // ignore: unnecessary_const
                              const Text('No results founds',
                                  // ignore: unnecessary_const
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _textEditingController!.text.isNotEmpty
                              ? _foundUsers.length
                              : _allUsers.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(6.0),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              color: Colors.green.withOpacity(0.5),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  CircleAvatar(
                                      minRadius: 30,
                                      child: Image.asset(
                                        "assets/logo/medicine.png",
                                        height: 35,
                                        width: 35,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _textEditingController!.text.isNotEmpty
                                        ? _foundUsers[index]['name']
                                        : _allUsers[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            );
                          },
                        ))
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * Text(
                                  _textEditingController!.text.isNotEmpty
                                      ? itemsInSearch[index]
                                      : items[index],
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
 */

/**
 * 
 * 
 *                  ListView.builder(
                        itemCount: _textEditingController!.text.isNotEmpty
                            ?  _foundUsers.length
                            : _allUsers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                CircleAvatar(
                                    minRadius: 30,
                                    child: Image.asset(
                                      "assets/logo/medicine.png",
                                      height: 35,
                                      width: 35,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  _textEditingController!.text.isNotEmpty
                                      ? _foundUsers[index]['name']
                                      : _allUsers[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        },
                      ),
 */