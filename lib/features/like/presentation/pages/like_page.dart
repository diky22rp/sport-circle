// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/features/like/presentation/cubit/like_cubit.dart';
import 'package:sport_circle/features/activity/presentation/pages/widgets/activity_list.dart';
import 'package:sport_circle/core/presentation/widgets/sport_circle_loading.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  Future<List<ActivityEntity>>? _future;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _future = context.read<LikeCubit>().getLikedActivities();
  }

  void _refresh() async {
    setState(() => _isLoading = true);
    await context.read<LikeCubit>().loadLikes();
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _future = context.read<LikeCubit>().getLikedActivities();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Activities'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refresh,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: _isLoading
          ? const SportCircleLoading(isOverlay: false)
          : Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    setState(() => _isLoading = true);
                    await context.read<LikeCubit>().loadLikes();
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      _future = context.read<LikeCubit>().getLikedActivities();
                      _isLoading = false;
                    });
                  },
                  child: FutureBuilder<List<ActivityEntity>>(
                    future: _future,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final likedActivities = snapshot.data!;
                      if (likedActivities.isEmpty) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: const [
                            SizedBox(height: 200),
                            Center(
                              child: Text('Belum ada activity yang di-like'),
                            ),
                          ],
                        );
                      }
                      return ActivityList(
                        activities: likedActivities,
                        hasReachedMax: true,
                        scrollController: ScrollController(),
                        physics: const AlwaysScrollableScrollPhysics(),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
