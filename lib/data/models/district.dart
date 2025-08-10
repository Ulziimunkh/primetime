import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

typedef DistrictEntry = DropdownMenuEntry<District>;
enum District {
  khanuul('Khanuul', 'Хан-Уул дүүрэг'),
  bayanzurkh('Bayanzurkh','Баянзүрх дүүрэг'),
  chingeltei('Chingeltei','Чингэлтэй дүүрэг'),
  bayangol('Bayangol','Баянгол дүүрэг'),
  sukhbaatar('Sukhbaatar','Сүхбаатар дүүрэг'),
  songinokhairkhan('Songinokhairkhan','Сонгинохайрхан дүүрэг'),
  nalaikh('Nalaikh','Налайх дүүрэг'),
  baganuur('Baganuur','Багануур дүүрэг'),
  bagakhangai('Bagakhangai','Багахангай дүүрэг');

  const District(this.code, this.name);
  final String code;
  final String name;

  static final List<DistrictEntry> entries = UnmodifiableListView<DistrictEntry>(
    values.map<DistrictEntry>(
      (District district) => DistrictEntry(
        value: district,
        label: district.name)
    )
  );
}