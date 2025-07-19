import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedy/Controller/Service/Parametragecontroller.dart';
import 'package:speedy/Page/Service/DetailService.dart';
import 'package:speedy/Repository/Service/ParametrageRepoImpl.dart';

import '../Model/Service/Service.dart';
import '../color/color.dart';

class Servicepage extends StatefulWidget {
  final int? idCategorie;
  const Servicepage({super.key, this.idCategorie});

  @override
  State<Servicepage> createState() => _ServicepageState();
}

class _ServicepageState extends State<Servicepage> {
  final parametrageController = Parametragecontroller(ParametrageRepoImpl());

  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController searchController = TextEditingController();

  int selectedService = -1;

  @override
  void initState() {
    // TODO: implement initState
    searchController.addListener(onSearchChanged);
    super.initState();
  }

  onSearchChanged() {
    print(searchController.text);
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  searchResultList() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: CupertinoSearchTextField(
          controller: searchController,
        ),
      ),
      body: Expanded(
        child: FutureBuilder<List<Service>>(
          future: widget.idCategorie == null
              ? parametrageController.fetchAllService()
              : parametrageController
                  .fecthServiceByCategorieService(widget.idCategorie!),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: secondary,
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Uner erreur est survenue"),
              );
            }
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65000,
                        child: serviceContainer(snapshot.data![index], index));
                  });
            }
            return Text("******Application Failed *******");
          }),
        ),
      ),
    );
  }

  serviceContainer(Service? service, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailService(
                      service: service,
                    )));
      },
      child: AnimatedContainer(
        //ca c'est pour l'apparution du cadre bleau sur le service
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.all(20.0),

        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/${service!.image}", height: 80),
          Expanded(
            child: Center(
              child: Text(
                service!.intitule!,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
