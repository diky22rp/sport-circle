import 'package:flutter/material.dart';

class Province {
  final int id;
  final String name;
  Province(this.id, this.name);
}

class City {
  final int id;
  final String name;
  final int provinceId;
  City(this.id, this.name, this.provinceId);
}

class LocationPickerBottomSheet extends StatefulWidget {
  final List<Province> provinces;
  final List<City> cities;
  final Province? selectedProvince;
  final City? selectedCity;
  final Function(Province?, City?) onApply;

  const LocationPickerBottomSheet({
    super.key,
    required this.provinces,
    required this.cities,
    this.selectedProvince,
    this.selectedCity,
    required this.onApply,
  });

  @override
  State<LocationPickerBottomSheet> createState() =>
      _LocationPickerBottomSheetState();
}

class _LocationPickerBottomSheetState extends State<LocationPickerBottomSheet> {
  Province? tempProvince;
  City? tempCity;
  String provinceSearch = '';
  String citySearch = '';

  @override
  void initState() {
    super.initState();
    tempProvince = widget.selectedProvince;
    tempCity = widget.selectedCity;
  }

  @override
  Widget build(BuildContext context) {
    final filteredProvinces = widget.provinces
        .where(
          (prov) =>
              prov.name.toLowerCase().contains(provinceSearch.toLowerCase()),
        )
        .toList();
    final filteredCities = widget.cities
        .where(
          (city) =>
              city.provinceId == (tempProvince?.id ?? -1) &&
              city.name.toLowerCase().contains(citySearch.toLowerCase()),
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
          // Search province
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
          // List province
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredProvinces.length,
              itemBuilder: (context, index) {
                final prov = filteredProvinces[index];
                final selected = prov.id == (tempProvince?.id ?? -1);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tempProvince = prov;
                      tempCity = null;
                    });
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
                      prov.name,
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
          // Search city
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
          // List city
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                final city = filteredCities[index];
                final selected =
                    city.id == (tempCity?.id ?? widget.selectedCity?.id);
                return ListTile(
                  title: Text(city.name),
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
