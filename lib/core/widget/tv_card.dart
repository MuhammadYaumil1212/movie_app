import 'package:day_watch/domain/movie/entities/tv_entity.dart';
import 'package:flutter/material.dart';

import '../config/theme/app_colors.dart';

class TvCard extends StatelessWidget {
  final TvEntity tvEntity;
  const TvCard({super.key, required this.tvEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(tvEntity.providePosterPath())),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tvEntity.originalName ?? "",
                      style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        Text(
                          ' ${tvEntity.voteAverage!.toStringAsFixed(1)}',
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
