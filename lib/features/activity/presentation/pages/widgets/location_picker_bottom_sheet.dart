import 'package:flutter/material.dart';
import 'package:sport_circle/features/location/domain/entities/province_entity.dart';
import 'package:sport_circle/features/location/domain/entities/city_entity.dart';

/// Picker for province and city selection. Data and state managed by parent.
class LocationPickerBottomSheet extends StatefulWidget {
  /// List of provinces to show
  final List<ProvinceEntity> provinces;

  /// List of cities to show
  final List<CityEntity> cities;

  /// Currently selected province
  final ProvinceEntity? selectedProvince;

  /// Currently selected city
  final CityEntity? selectedCity;

  /// Callback for apply action
  final void Function(ProvinceEntity?, CityEntity?) onApply;

  /// Callback for province change
  final void Function(ProvinceEntity?)? onProvinceChanged;

  const LocationPickerBottomSheet({
    super.key,
    required this.provinces,
    required this.cities,
    this.selectedProvince,
    this.selectedCity,
    required this.onApply,
    this.onProvinceChanged,
  });

  @override
  State<LocationPickerBottomSheet> createState() =>
      _LocationPickerBottomSheetState();
}

class _LocationPickerBottomSheetState extends State<LocationPickerBottomSheet> {
  ProvinceEntity? tempProvince;
  CityEntity? tempCity;
  String provinceSearch = '';
  String citySearch = '';

  @override
  void initState() {
    super.initState();
    tempProvince = widget.selectedProvince;
    tempCity = widget.selectedCity;
    provinceSearch = '';
    citySearch = '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provinceScrollToSelected();
      _cityScrollToSelected();
    });
  }

  @override
  void didUpdateWidget(LocationPickerBottomSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedProvince != oldWidget.selectedProvince ||
        widget.selectedCity != oldWidget.selectedCity) {
      tempProvince = widget.selectedProvince;
      tempCity = widget.selectedCity;
      provinceSearch = '';
      citySearch = '';
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _provinceScrollToSelected();
        _cityScrollToSelected();
      });
    }
  }

  final _provinceScrollController = ScrollController();
  final _cityScrollController = ScrollController();

  void _provinceScrollToSelected() {
    final filteredProvinces = widget.provinces
        .where(
          (prov) => prov.provinceName.toLowerCase().contains(
            provinceSearch.toLowerCase(),
          ),
        )
        .toList();
    final idx = filteredProvinces.indexWhere(
      (prov) => prov.provinceId == tempProvince?.provinceId,
    );
    if (idx != -1 && _provinceScrollController.hasClients) {
      _provinceScrollController.animateTo(
        idx * 120.0, // approx item width
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void _cityScrollToSelected() {
    final filteredCities = widget.cities
        .where(
          (city) =>
              city.provinceId == (tempProvince?.provinceId ?? -1) &&
              city.cityName.toLowerCase().contains(citySearch.toLowerCase()),
        )
        .toList();
    final idx = filteredCities.indexWhere(
      (city) => city.cityId == tempCity?.cityId,
    );
    if (idx != -1 && _cityScrollController.hasClients) {
      _cityScrollController.animateTo(
        idx * 56.0, // approx item height
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProvinces = widget.provinces
        .where(
          (prov) => prov.provinceName.toLowerCase().contains(
            provinceSearch.toLowerCase(),
          ),
        )
        .toList();
    final filteredCities = widget.cities
        .where(
          (city) =>
              city.provinceId == (tempProvince?.provinceId ?? -1) &&
              city.cityName.toLowerCase().contains(citySearch.toLowerCase()),
        )
        .toList();

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pilih Lokasi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          if (widget.provinces.isEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tidak ada data provinsi',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari provinsi',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            onChanged: (val) {
              setState(() => provinceSearch = val);
            },
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 60,
            child: ListView.builder(
              controller: _provinceScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: filteredProvinces.length,
              itemBuilder: (context, index) {
                final prov = filteredProvinces[index];
                final selected =
                    prov.provinceId == (tempProvince?.provinceId ?? -1);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tempProvince = prov;
                      tempCity = null;
                    });
                    if (widget.onProvinceChanged != null) {
                      widget.onProvinceChanged!(prov);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: selected ? Colors.blue[50] : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selected ? Colors.blue : Colors.grey[300]!,
                        width: selected ? 2 : 1,
                      ),
                    ),
                    child: Text(
                      prov.provinceName,
                      style: TextStyle(
                        color: selected ? Colors.blue : Colors.black,
                        fontWeight: selected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          if (widget.cities.isEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tidak ada data kota',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari kota',
              prefixIcon: Icon(Icons.location_city),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            onChanged: (val) {
              setState(() => citySearch = val);
            },
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.builder(
              controller: _cityScrollController,
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                final city = filteredCities[index];
                final selected =
                    city.cityId ==
                    (tempCity?.cityId ?? widget.selectedCity?.cityId);
                return ListTile(
                  title: Text(city.cityName),
                  leading: Icon(
                    Icons.location_on,
                    color: selected ? Colors.blue : Colors.grey,
                  ),
                  selected: selected,
                  onTap: () {
                    setState(() => tempCity = city);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    widget.onApply(tempProvince, tempCity);
                    Navigator.of(context).pop();
                  },
                  child: Text('Terapkan'),
                ),
              ),
              SizedBox(width: 12),
              if (tempProvince != null || tempCity != null)
                IconButton(
                  icon: Icon(Icons.delete_forever_rounded, color: Colors.red),
                  tooltip: 'Clear lokasi',
                  onPressed: () {
                    widget.onApply(null, null);
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
          SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
