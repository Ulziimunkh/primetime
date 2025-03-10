import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'district.dart';
typedef KhorooEntry = DropdownMenuEntry<Khoroo>;
enum Khoroo {
  one('1-Khoroo', '1-хороо'),
  two('2-Khoroo','2-хороо'),
  three('3-Khoroo', '3-хороо'),
  four('4-Khoroo', '4-хороо'),
  five('5-Khoroo', '5-хороо'),
  six('6-Khoroo', '6-хороо'),
  seven('7-Khoroo', '7-хороо'),
  eight('8-Khoroo', '8-хороо'),
  nine('9-Khoroo', '9-хороо'),
  ten('10-Khoroo', '10-хороо'),
  eleven('11-Khoroo', '11-хороо'),
  twelve('12-Khoroo', '12-хороо'),
  thirteen('13-Khoroo', '13-хороо'),
  fourteen('14-Khoroo', '14-хороо'),
  fifteen('15-Khoroo', '15-хороо'),
  sixteen('16-Khoroo', '16-хороо'),
  seventeen('17-Khoroo', '17-хороо'),
  eighteen('18-Khoroo', '18-хороо'),
  nineteen('19-Khoroo', '19-хороо'),
  twenty('20-Khoroo', '20-хороо'),
  twentyOne('21-Khoroo', '21-хороо'),
  twentyTwo('22-Khoroo', '22-хороо'),
  twentyThree('23-Khoroo', '23-хороо'),
  twentyFour('24-Khoroo', '24-хороо'),
  twentyFive('25-Khoroo', '25-хороо'),
  twentySix('26-Khoroo', '26-хороо'),
  twentySeven('27-Khoroo', '27-хороо'),
  twentyEight('28-Khoroo', '28-хороо'),
  twentyNine('29-Khoroo', '29-хороо'),
  thirty('30-Khoroo', '30-хороо'),
  thirtyOne('31-Khoroo', '31-хороо'),
  thirtyTwo('32-Khoroo', '32-хороо'),
  thirtyThree('33-Khoroo', '33-хороо'),
  thirtyFour('34-Khoroo', '34-хороо'),
  thirtyFive('35-Khoroo', '35-хороо'),
  thirtySix('36-Khoroo', '36-хороо'),
  thirtySeven('37-Khoroo', '37-хороо'),
  thirtyEight('38-Khoroo', '38-хороо'),
  thirtyNine('39-Khoroo', '39-хороо'),
  forty('40-Khoroo', '40-хороо'),
  fortyOne('41-Khoroo', '41-хороо'),
  fortyTwo('42-Khoroo', '42-хороо'),
  fortyThree('43-Khoroo', '43-хороо');

  const Khoroo(this.code, this.name);
  final String code;
  final String name;

  
  static final List<KhorooEntry> entries = UnmodifiableListView<KhorooEntry>(
    values.map<KhorooEntry>(
      (Khoroo khoroo) => KhorooEntry(
        value: khoroo,
        label: khoroo.name)
    )
  );
  static List<DropdownMenuEntry<Khoroo>> getEntries(List<Khoroo> khoroos) {
    return khoroos.map((khoroo) {
      return DropdownMenuEntry<Khoroo>(
        value: khoroo,
        label: khoroo.name,
      );
    }).toList();
  }
  static final Map<District, List<Khoroo>> districtKhorooMap = {
  District.baganuur: [
    Khoroo.one,
    Khoroo.two,
    Khoroo.three,
    Khoroo.four,
    Khoroo.five,
  ],
  District.bagakhangai: [
    Khoroo.one,
    Khoroo.two,
  ],
  District.bayangol: [
    Khoroo.one,
    Khoroo.two,
    Khoroo.three,
    Khoroo.four,
    Khoroo.five,
    Khoroo.six,
    Khoroo.seven,
    Khoroo.eight,
    Khoroo.nine,
    Khoroo.ten,
    Khoroo.eleven,
    Khoroo.twelve,
    Khoroo.thirteen,
    Khoroo.fourteen,
    Khoroo.fifteen,
    Khoroo.sixteen,
    Khoroo.seventeen,
    Khoroo.eighteen,
    Khoroo.nineteen,
    Khoroo.twenty,
    Khoroo.twentyOne,
    Khoroo.twentyTwo,
    Khoroo.twentyThree,
    Khoroo.twentyFour,
    Khoroo.twentyFive,
    Khoroo.twentySix,
    Khoroo.twentySeven,
    Khoroo.twentyEight,
    Khoroo.twentyNine,
    Khoroo.thirty,
    Khoroo.thirtyOne,
    Khoroo.thirtyTwo,
    Khoroo.thirtyThree,
    Khoroo.thirtyFour,
    Khoroo.thirtyFive,
  ],
  District.bayanzurkh: [
    Khoroo.one,
    Khoroo.two,
    Khoroo.three,
    Khoroo.four,
    Khoroo.five,
    Khoroo.six,
    Khoroo.seven,
    Khoroo.eight,
    Khoroo.nine,
    Khoroo.ten,
    Khoroo.eleven,
    Khoroo.twelve,
    Khoroo.thirteen,
    Khoroo.fourteen,
    Khoroo.fifteen,
    Khoroo.sixteen,
    Khoroo.seventeen,
    Khoroo.eighteen,
    Khoroo.nineteen,
    Khoroo.twenty,
    Khoroo.twentyOne,
    Khoroo.twentyTwo,
    Khoroo.twentyThree,
    Khoroo.twentyFour,
    Khoroo.twentyFive,
    Khoroo.twentySix,
    Khoroo.twentySeven,
    Khoroo.twentyEight,
    Khoroo.twentyNine,
    Khoroo.thirty,
    Khoroo.thirtyOne,
    Khoroo.thirtyTwo,
    Khoroo.thirtyThree,
    Khoroo.thirtyFour,
    Khoroo.thirtyFive,
    Khoroo.thirtySix,
    Khoroo.thirtySeven,
    Khoroo.thirtyEight,
    Khoroo.thirtyNine,
    Khoroo.forty,
    Khoroo.fortyOne,
    Khoroo.fortyTwo,
    Khoroo.fortyThree,
  ],
  District.nalaikh: [
    Khoroo.one,
    Khoroo.two,
    Khoroo.three,
    Khoroo.four,
    Khoroo.five,
    Khoroo.six,
    Khoroo.seven,
    Khoroo.eight,
  ],
  District.songinokhairkhan: [
    Khoroo.one,
    Khoroo.two,
    Khoroo.three,
    Khoroo.four,
    Khoroo.five,
    Khoroo.six,
    Khoroo.seven,
    Khoroo.eight,
    Khoroo.nine,
    Khoroo.ten,
    Khoroo.eleven,
    Khoroo.twelve,
    Khoroo.thirteen,
    Khoroo.fourteen,
    Khoroo.fifteen,
    Khoroo.sixteen,
    Khoroo.seventeen,
    Khoroo.eighteen,
    Khoroo.nineteen,
    Khoroo.twenty,
    Khoroo.twentyOne,
    Khoroo.twentyTwo,
    Khoroo.twentyThree,
    Khoroo.twentyFour,
    Khoroo.twentyFive,
    Khoroo.twentySix,
    Khoroo.twentySeven,
    Khoroo.twentyEight,
    Khoroo.twentyNine,
    Khoroo.thirty,
    Khoroo.thirtyOne,
    Khoroo.thirtyTwo,
    Khoroo.thirtyThree,
    Khoroo.thirtyFour,
    Khoroo.thirtyFive,
    Khoroo.thirtySix,
    Khoroo.thirtySeven,
    Khoroo.thirtyEight,
    Khoroo.thirtyNine,
    Khoroo.forty,
    Khoroo.fortyOne,
    Khoroo.fortyTwo,
    Khoroo.fortyThree,
  ],
  District.sukhbaatar: [
    Khoroo.one,
    Khoroo.two,
    Khoroo.three,
    Khoroo.four,
    Khoroo.five,
    Khoroo.six,
    Khoroo.seven,
    Khoroo.eight,
    Khoroo.nine,
    Khoroo.ten,
    Khoroo.eleven,
    Khoroo.twelve,
    Khoroo.thirteen,
    Khoroo.fourteen,
    Khoroo.fifteen,
    Khoroo.sixteen,
    Khoroo.seventeen,
    Khoroo.eighteen,
    Khoroo.nineteen,
    Khoroo.twenty,
  ],
  District.khanuul: [
    Khoroo.one,
    Khoroo.two,
    Khoroo.three,
    Khoroo.four,
    Khoroo.five,
    Khoroo.six,
    Khoroo.seven,
    Khoroo.eight,
    Khoroo.nine,
    Khoroo.ten,
    Khoroo.eleven,
    Khoroo.twelve,
    Khoroo.thirteen,
    Khoroo.fourteen,
    Khoroo.fifteen,
    Khoroo.sixteen,
    Khoroo.seventeen,
    Khoroo.eighteen,
    Khoroo.nineteen,
    Khoroo.twenty,
    Khoroo.twentyOne,
    Khoroo.twentyTwo,
    Khoroo.twentyThree,
    Khoroo.twentyFour,
    Khoroo.twentyFive,
  ],
};
}