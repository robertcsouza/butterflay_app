import 'package:flutter/material.dart';

import '../settings/colors.dart';

Widget cardProduct({context}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/product/detail');
    },
    child: Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            children: [
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy6DOSBHvdki5CQ5H145jn1DHB9sxcDRwZ5FihsbUkKE2Aw3UsIBCFvvN2Tnifw7Y0HaA&usqp=CAU',
                      width: 100,
                      height: 100,
                    ),
                  )),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Conjunto listrado',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('R\$ 35,00'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: dark, width: 1.5),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'P',
                                    style: TextStyle(fontSize: 12),
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: dark, width: 1.5),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'M',
                                    style: TextStyle(fontSize: 12),
                                  )),
                                ),
                              ),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: dark, width: 1.5),
                                ),
                                child: Center(
                                    child: Text(
                                  'G',
                                  style: TextStyle(fontSize: 12),
                                )),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 16),
                            child: Row(
                              children: [
                                Text('Disponibilidade ',
                                    style: TextStyle(fontSize: 10)),
                                Text(
                                  '08 em estoque',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: dark,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
