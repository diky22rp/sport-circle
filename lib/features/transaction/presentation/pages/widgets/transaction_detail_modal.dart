import 'package:flutter/material.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';
import 'status_badge.dart';

class TransactionDetailModal extends StatelessWidget {
  final TransactionEntity tx;
  final VoidCallback? onUploadProof;
  final VoidCallback? onCancel;

  const TransactionDetailModal({
    super.key,
    required this.tx,
    this.onUploadProof,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final activity = tx.transactionItems.sportActivities;
    final imageUrl = activity.imageUrl ?? '';
    return Container(
      height: MediaQuery.of(context).size.height * 0.96,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageUrl.isNotEmpty
                          ? imageUrl
                          : 'https://via.placeholder.com/160x160?text=No+Image',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 160,
                        height: 160,
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 60,
                        ),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 160,
                          height: 160,
                          color: Colors.grey[100],
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  activity.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                StatusBadge(status: tx.status),
                const SizedBox(height: 8),
                Text('Invoice: ${tx.invoiceId}'),
                Text('Tanggal Order: ${tx.orderDate}'),
                Text('Expired: ${tx.expiredDate}'),
                Text('Total: Rp${tx.totalAmount}'),
                const SizedBox(height: 8),
                Text('Alamat: ${activity.address}'),
                Text(
                  'Jadwal: ${activity.activityDate} | ${activity.startTime} - ${activity.endTime}',
                ),
                const SizedBox(height: 16),
                if (tx.status == 'pending') ...[
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: onUploadProof,
                        icon: const Icon(Icons.upload),
                        label: const Text('Upload Bukti'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton.icon(
                        onPressed: onCancel,
                        icon: const Icon(Icons.cancel),
                        label: const Text('Cancel'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 32),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              icon: const Icon(Icons.close, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
