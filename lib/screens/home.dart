import 'dart:convert';

import 'package:chapa/models/country_model.dart';
import 'package:chapa/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var firstNameF = FocusNode();
  var middleNameF = FocusNode();
  var lastNameF = FocusNode();

  var firstNameC = TextEditingController();
  var middleNameC = TextEditingController();
  var lastNameC = TextEditingController();

  List<Country> countries = List();

  xml.XmlDocument parsedXml;
  Iterable<xml.XmlElement> items;
  var selectedCountry;

  Future _parsing(var _response) async {
    var _document = xml.parse(_response);
    setState(() {
      var allCountries = _document.findAllElements('m:tCountryCodeAndName');
//          .map<xml.XmlElement>((e) => Text(e.findAllElements('m:sName').first.text))
//          .toList();
      var allCountriesPlus = allCountries.map((e) => Country(e.findElements('m:sName').first.text,
          e.findElements('m:sISOCode').first.text, '', '',
          '')).toList();
    countries = allCountriesPlus;
    });


    items = _document.findAllElements('m:ListOfCountryNamesByNameResult');
    List<dynamic> itemsList = [];
    items.map((xml.XmlElement item) {
      var _addResult = _getValue(item.findElements("m:tCountryCodeAndName"));
      itemsList.add(_addResult);
    }).toList();

    setState(() {
//      _testValue = itemsList[0].toString();
//      _add = true;
    });
  }

  _getValue(Iterable<xml.XmlElement> items) {
    var textValue;
    items.map((xml.XmlElement node) {
      textValue = node.text;
    }).toList();
    return textValue;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    fetchSelectedCountry('ET');
    fetchAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              child: DropdownButtonFormField(
                isExpanded: true,
                hint: Text(
                  "Country",
                ),
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.public,
                    color: Theme.of(context).primaryColor,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  border: OutlineInputBorder(),
                  filled: false,
                ),
                items: countries
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value.name.trim(),
                          ),
                          value: value.code,
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedCountry = val;
                    fetchSelectedCountry(selectedCountry);
                  });
                },
                value: selectedCountry,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton('Country Info', Theme.of(context).primaryColor, 15,
                15, Colors.white, () {
//                fetchSelectedCountry('ET');
            }),
            parsedXml != null
                ? Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //         <--- border radius here
                              ),
                        ), //       <--- BoxDecoration here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Code",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Chip(
                                label: Text(parsedXml
                                        .findAllElements('m:sISOCode')
                                        .first
                                        .text ??
                                    '')),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //         <--- border radius here
                              ),
                        ), //       <--- BoxDecoration here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Phone Code",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Chip(
                                label: Text('+'+parsedXml
                                        .findAllElements('m:sPhoneCode')
                                        .first
                                        .text ??
                                    '')),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //         <--- border radius here
                              ),
                        ), //       <--- BoxDecoration here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Capital City",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Chip(
                                label: Text(parsedXml
                                        .findAllElements('m:sCapitalCity')
                                        .first
                                        .text ??
                                    '')),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //         <--- border radius here
                              ),
                        ), //       <--- BoxDecoration here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Currency",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Chip(
                                label: Text(parsedXml
                                        .findAllElements('m:sCurrencyISOCode')
                                        .first
                                        .text ??
                                    '')),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //         <--- border radius here
                              ),
                        ), //       <--- BoxDecoration here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Flag",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Image.network(parsedXml
                                      .findAllElements('m:sCountryFlag')
                                      .first
                                      .text ??
                                   ''),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.public,
                          size: 45.0,
                        ),
                        Chip(
                          label: Text('Please Select Country!'),
                        )
                      ],
                    ),
                  )
          ],
        ),
      )),
      drawer: Drawer(),
    );
  }

  void fetchSelectedCountry(String code) async {
    var url =
        'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso';
    var envelope = '''
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
    <Body>
        <FullCountryInfo xmlns="http://www.oorsprong.org/websamples.countryinfo">
            <sCountryISOCode>$code</sCountryISOCode>
        </FullCountryInfo>
    </Body>
</Envelope>
''';
    await http
        .post(url,
            headers: {
              "Content-Type": "text/xml;charset=UTF-8",
              "cache-control": "no-cache"
            },
            body: utf8.encode(envelope),
            encoding: Encoding.getByName("UTF-8"))
        .then((res) {
      setState(() {
        parsedXml = xml.parse(res.body);
      });
    });
  }

  void fetchAllCountries() async {
    var url =
        'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso';
    var envelope = '''
<Envelope xmlns="http://www.w3.org/2003/05/soap-envelope">
    <Body>
        <ListOfCountryNamesByName xmlns="http://www.oorsprong.org/websamples.countryinfo"/>
    </Body>
</Envelope>
''';
    await http
        .post(url,
            headers: {
              "SOAPAction":
                  "http://www.totvs.com/IwsConsultaSQL/RealizarConsultaSQL",
              "Content-Type": "text/xml;charset=UTF-8",
              "cache-control": "no-cache"
            },
            body: utf8.encode(envelope),
            encoding: Encoding.getByName("UTF-8"))
        .then((res) {
      _parsing(res.body);
    });
  }
}
