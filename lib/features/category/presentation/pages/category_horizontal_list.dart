import 'package:flutter/material.dart';
import 'package:sport_circle/features/category/data/models/category_model.dart';
import 'package:sport_circle/core/utils/string_utils.dart';

class CategoryHorizontalList extends StatelessWidget {
  final List<CategoryModel> categories;
  final String? selectedCategoryId;
  final ValueChanged<String?>? onCategorySelected;
  const CategoryHorizontalList({
    required this.categories,
    this.selectedCategoryId,
    this.onCategorySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Increased height to prevent overflow
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final selected = cat.id == selectedCategoryId;
          return IntrinsicWidth(
            child: GestureDetector(
              onTap: () => onCategorySelected?.call(cat.id),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: selected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[200],
                    child: Icon(
                      Icons.sports_soccer,
                      color: selected ? Colors.white : Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    StringUtils.capitalizeFirstLetter(cat.name),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: selected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
