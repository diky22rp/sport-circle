import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_circle/core/presentation/widgets/sport_circle_loading.dart';
import 'package:sport_circle/core/themes/app_theme.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/features/like/presentation/cubit/like_cubit.dart';

class ActivityList extends StatelessWidget {
  final List<ActivityEntity> activities;
  final bool hasReachedMax;
  final ScrollController scrollController;
  final ScrollPhysics? physics;
  final void Function(ActivityEntity)? onTap;

  const ActivityList({
    super.key,
    required this.activities,
    required this.hasReachedMax,
    required this.scrollController,
    this.physics,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return const Center(child: Text('No activities found.'));
    }
    return ListView.builder(
      controller: scrollController,
      physics: physics,
      itemCount: hasReachedMax ? activities.length : activities.length + 1,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (context, index) {
        if (index < activities.length) {
          final activity = activities[index];
          return InkWell(
            onTap: onTap != null ? () => onTap!(activity) : null,
            borderRadius: BorderRadius.circular(16),
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar dummy
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.broken_image, size: 48),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              activity.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            BlocBuilder<LikeCubit, Map<int, bool>>(
                              builder: (context, likes) {
                                final isLiked = likes[activity.id] ?? false;
                                return InkWell(
                                  onTap: () => context
                                      .read<LikeCubit>()
                                      .toggleLike(activity),
                                  borderRadius: BorderRadius.circular(24),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked
                                          ? AppTheme.primary
                                          : Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          activity.address,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              activity.activityDate,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Rp${activity.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Loading indicator untuk infinite scroll
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: SportCircleLoading(isOverlay: false)),
          );
        }
      },
    );
  }
}
