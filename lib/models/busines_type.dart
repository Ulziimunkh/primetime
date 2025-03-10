import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

typedef BusinessTypeEntry = DropdownMenuEntry<BusinessType>;
enum BusinessType {
  barbershop('Barbershop', 'Үсчин'),
  beautySalon('BeautySalon','Гоо Сайхны салон'),
  manicureAndPedicure('ManicureAndPedicure','Маникюр, Педикюр'),
  therapyService('TherapyService','Алжаал тайлах төв');

  const BusinessType(this.code, this.name);
  final String code;
  final String name;

  static final List<BusinessTypeEntry> entries = UnmodifiableListView<BusinessTypeEntry>(
    values.map<BusinessTypeEntry>(
      (BusinessType businessType) => BusinessTypeEntry(
        value: businessType,
        label: businessType.name)
    )
  );
}