enum ReqStatus { processing, pendingPayment, done }

class RequestItem {
  final String id;
  final String type;
  final ReqStatus status;
  final int step;
  final int total;
  final String date;
  final String amount;
  const RequestItem(this.id, this.type, this.status, this.step, this.total, this.date, this.amount);
}

const List<RequestItem> mockRequests = [
  RequestItem('BH-2025-1841', 'تأسيس مؤسسة فردية', ReqStatus.processing, 3, 6, '15 يوليو 2025', '45 د.ب'),
  RequestItem('BH-2025-1790', 'إضافة نشاط تجاري', ReqStatus.pendingPayment, 5, 6, '10 يوليو 2025', '30 د.ب'),
  RequestItem('BH-2025-1733', 'تجديد السجل التجاري', ReqStatus.done, 6, 6, '2 يوليو 2025', '25 د.ب'),
  RequestItem('BH-2025-1680', 'رفع مخالفة إيقاف إداري', ReqStatus.done, 6, 6, '20 يونيو 2025', '90 د.ب'),
];
