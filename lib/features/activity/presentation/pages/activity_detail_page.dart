import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_circle/core/presentation/widgets/app_snackbar.dart';
import 'package:sport_circle/core/utils/date_utils.dart' as date_utils;
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/features/like/presentation/cubit/like_cubit.dart';
import 'package:sport_circle/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:sport_circle/features/activity/presentation/pages/widgets/detail/info_card.dart';
import 'package:sport_circle/features/activity/presentation/pages/widgets/detail/payment_method_dialog.dart';
import 'package:sport_circle/features/activity/presentation/pages/widgets/detail/participants_list.dart';

class ActivityDetailPage extends StatefulWidget {
  final ActivityEntity activity;
  const ActivityDetailPage({super.key, required this.activity});

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            AppSnackbar.show(
              context,
              message: 'Memproses transaksi...',
              type: AppSnackbarType.info,
            );
          },
          success: () {
            AppSnackbar.show(
              context,
              message: 'Transaksi berhasil!',
              type: AppSnackbarType.success,
            );
          },
          error: (msg) {
            AppSnackbar.show(
              context,
              message: msg,
              type: AppSnackbarType.error,
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 240,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Gambar utama activity
                        Image.network(
                          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) =>
                              Container(color: Colors.grey[300]),
                        ),
                        // Overlay gradient
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                                Colors.black.withOpacity(0.2),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    BlocBuilder<LikeCubit, Map<int, bool>>(
                      builder: (context, likes) {
                        final isLiked = likes[widget.activity.id] ?? false;
                        return IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context.read<LikeCubit>().toggleLike(
                              widget.activity,
                            );
                          },
                        );
                      },
                    ),
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.activity.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Kategori (pakai ID, bisa diimprove jika ada mapping)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.pink[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Slot : ${widget.activity.slot}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              child: Text(
                                widget.activity.organizer.name.isNotEmpty
                                    ? widget.activity.organizer.name[0]
                                    : '?',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hosted by ${widget.activity.organizer.name}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.activity.organizer.email,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            InfoCard(
                              icon: Icons.calendar_today,
                              label: 'DATE',
                              value: date_utils.DateUtils.formatTanggalIndo(
                                widget.activity.activityDate,
                              ),
                            ),
                            const SizedBox(width: 10),
                            InfoCard(
                              icon: Icons.access_time,
                              label: 'TIME',
                              value:
                                  '${date_utils.DateUtils.formatJamIndo(widget.activity.startTime)} - ${date_utils.DateUtils.formatJamIndo(widget.activity.endTime)}',
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        const Text(
                          'About this activity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '-',
                          style: TextStyle(color: Colors.grey),
                        ), // Tidak ada field description
                        const SizedBox(height: 20),
                        const Text(
                          'Location',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${widget.activity.address}, ${widget.activity.city.cityNameFull},',
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Participants',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (widget.activity.participants.isEmpty)
                          const Text(
                            'No participants yet.',
                            style: TextStyle(color: Colors.grey),
                          ),
                        if (widget.activity.participants.isNotEmpty)
                          ParticipantsList(
                            participants: widget.activity.participants,
                          ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'Rp${widget.activity.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 14,
                                ),
                              ),
                              onPressed: _onJoinActivity,
                              child: const Text(
                                'Join Activity',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onJoinActivity() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Gabung Aktivitas?'),
        content: const Text('Apakah Anda yakin ingin join activity ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Tidak'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            child: const Text('Ya, Join'),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (confirm == true) {
      final paymentMethodId = await _selectPaymentMethod(context);
      if (paymentMethodId != null) {
        context.read<TransactionBloc>().add(
          TransactionEvent.createTransaction(
            slot: widget.activity.slot ?? 0,
            sportActivityId: widget.activity.id,
            paymentMethodId: paymentMethodId,
          ),
        );
      }
    }
  }

  Future<int?> _selectPaymentMethod(BuildContext context) async {
    final paymentMethods = [
      {
        "id": 1,
        "name": "BCA",
        "image_url":
            "https://dibimbing-cdn.sgp1.cdn.digitaloceanspaces.com/bca-logo.svg",
      },
      {
        "id": 2,
        "name": "Bank BRI",
        "image_url":
            "https://dibimbing-cdn.sgp1.cdn.digitaloceanspaces.com/bri-logo.svg",
      },
      {
        "id": 3,
        "name": "Bank Mandiri",
        "image_url":
            "https://dibimbing-cdn.sgp1.cdn.digitaloceanspaces.com/mandiri-logo.svg",
      },
      {
        "id": 4,
        "name": "Bank BNI",
        "image_url":
            "https://dibimbing-cdn.sgp1.cdn.digitaloceanspaces.com/bni-logo.svg",
      },
    ];

    return await showDialog<int>(
      context: context,
      builder: (ctx) => PaymentMethodDialog(paymentMethods: paymentMethods),
    );
  }
}
