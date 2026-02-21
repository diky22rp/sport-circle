import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_circle/core/presentation/widgets/sport_circle_loading.dart';
import 'package:sport_circle/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:sport_circle/features/activity/presentation/bloc/activity_event.dart';
import 'package:sport_circle/features/activity/presentation/bloc/activity_state.dart';
import 'package:sport_circle/features/category/presentation/pages/category_horizontal_list.dart';
import 'package:sport_circle/features/category/presentation/bloc/category_bloc.dart';
import 'package:sport_circle/features/category/presentation/pages/category_horizontal_list_skeleton.dart';

import 'package:sport_circle/features/activity/presentation/pages/widgets/activity_search_bar.dart';
import 'package:sport_circle/features/activity/presentation/pages/widgets/location_filter_button.dart';
import 'package:sport_circle/features/activity/presentation/pages/widgets/location_picker_bottom_sheet.dart';
import 'package:sport_circle/features/activity/presentation/pages/widgets/activity_list.dart';

// Hardcode data (gunakan model dari location_picker_bottom_sheet.dart)
final List<Province> provinces = [
  Province(31, 'DKI Jakarta'),
  Province(11, 'Aceh'),
];

final List<City> cities = [
  City(3172, 'Jakarta Timur', 31),
  City(1101, 'Simeulue', 11),
  City(1113, 'Gayo Lues', 11),
];

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  int _page = 1;
  final int _perPage = 10;
  String? _selectedCategoryId;
  String? _search;
  bool _isSearchFocused = false;

  Timer? _debounce;

  Province? _selectedProvince;
  City? _selectedCity;
  bool _isFetching = false; // Tambahkan flag ini

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(CategoryEvent.fetch());
    context.read<ActivityBloc>().add(
      ActivityEvent.fetchActivities(
        page: _page,
        perPage: _perPage,
        sportCategoryId: _selectedCategoryId == null
            ? null
            : int.tryParse(_selectedCategoryId!),
        search: null,
      ),
    );
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);

    _searchFocusNode.addListener(() {
      setState(() {
        _isSearchFocused = _searchFocusNode.hasFocus;
      });
    });
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _search = _searchController.text.isEmpty
            ? null
            : _searchController.text;
        _page = 1;
      });
      context.read<ActivityBloc>().add(
        ActivityEvent.fetchActivities(
          page: 1,
          perPage: _perPage,
          sportCategoryId: _selectedCategoryId == null
              ? null
              : int.tryParse(_selectedCategoryId!),
          search: _search,
        ),
      );
    });
  }

  void _onScroll() {
    final bloc = context.read<ActivityBloc>();
    final state = bloc.state;
    state.whenOrNull(
      loaded: (activities, hasReachedMax) {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
          if (!hasReachedMax && !_isFetching) {
            _isFetching = true; // Set flag sebelum fetch
            _page++;
            bloc.add(
              ActivityEvent.fetchActivities(
                page: _page,
                perPage: _perPage,
                sportCategoryId: _selectedCategoryId == null
                    ? null
                    : int.tryParse(_selectedCategoryId!),
                search: _search,
              ),
            );
          }
        }
      },
    );
  }

  void _showLocationPicker() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return LocationPickerBottomSheet(
          provinces: provinces,
          cities: cities,
          selectedProvince: _selectedProvince,
          selectedCity: _selectedCity,
          onApply: (prov, city) {
            setState(() {
              _selectedProvince = prov;
              _selectedCity = city;
              context.read<ActivityBloc>().add(
                ActivityEvent.fetchActivities(
                  page: 1,
                  perPage: _perPage,
                  cityId: city?.id,
                  sportCategoryId: _selectedCategoryId == null
                      ? null
                      : int.tryParse(_selectedCategoryId!),
                  search: _search,
                ),
              );
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Tombol filter lokasi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: LocationFilterButton(
                cityLabel: _selectedCity != null
                    ? '${_selectedCity!.name}, ${_selectedProvince?.name ?? ''}'
                    : null,
                onPressed: _showLocationPicker,
                onClear: (_selectedCity != null || _selectedProvince != null)
                    ? () {
                        setState(() {
                          _selectedProvince = null;
                          _selectedCity = null;
                          context.read<ActivityBloc>().add(
                            ActivityEvent.fetchActivities(
                              page: 1,
                              perPage: _perPage,
                              cityId: null,
                              sportCategoryId: _selectedCategoryId == null
                                  ? null
                                  : int.tryParse(_selectedCategoryId!),
                              search: _search,
                            ),
                          );
                        });
                      }
                    : null,
              ),
            ),
            // Search bar
            ActivitySearchBar(
              controller: _searchController,
              focusNode: _searchFocusNode,
              isFocused: _isSearchFocused,
              onChanged: (val) => _onSearchChanged(),
            ),
            // Kategori horizontal (hanya tampil jika search tidak focus)
            if (!_isSearchFocused)
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const CategoryHorizontalListSkeleton();
                  } else if (state is CategoryLoaded) {
                    return CategoryHorizontalList(
                      categories: state.categories,
                      selectedCategoryId: _selectedCategoryId,
                      onCategorySelected: (id) {
                        setState(() => _selectedCategoryId = id);
                        context.read<ActivityBloc>().add(
                          ActivityEvent.fetchActivities(
                            page: 1,
                            perPage: _perPage,
                            sportCategoryId: id == null
                                ? null
                                : int.tryParse(id),
                            search: _search,
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox(height: 80);
                },
              ),
            // List activity atau pesan search
            Expanded(
              child: _isSearchFocused
                  ? Center(
                      child: Text(
                        'Silahkan ketik apa yang anda cari kemudian enter',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    )
                  : BlocBuilder<ActivityBloc, ActivityState>(
                      builder: (context, state) {
                        // Reset flag ketika loading selesai
                        state.whenOrNull(
                          loaded: (_, __) => _isFetching = false,
                          error: (_) => _isFetching = false,
                        );
                        return state.when(
                          initial: () => const Center(
                            child: SportCircleLoading(isOverlay: false),
                          ),
                          loading: () => const Center(
                            child: SportCircleLoading(isOverlay: false),
                          ),
                          loaded: (activities, hasReachedMax) {
                            return RefreshIndicator(
                              onRefresh: () async {
                                _page = 1;
                                context.read<ActivityBloc>().add(
                                  ActivityEvent.fetchActivities(
                                    page: 1,
                                    perPage: _perPage,
                                    sportCategoryId: _selectedCategoryId == null
                                        ? null
                                        : int.tryParse(_selectedCategoryId!),
                                    search: _search,
                                    cityId: _selectedCity?.id,
                                  ),
                                );
                                // Optionally wait for loading to finish
                                await Future.delayed(
                                  const Duration(milliseconds: 600),
                                );
                              },
                              child: ActivityList(
                                activities: activities,
                                hasReachedMax: hasReachedMax,
                                scrollController: _scrollController,
                              ),
                            );
                          },
                          error: (message) => Center(child: Text(message)),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }
}
