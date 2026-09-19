import 'package:flutter/material.dart';

class SubService {
  final String name;
  final String time;
  final String fee;
  const SubService(this.name, this.time, this.fee);
}

class ServiceCategory {
  final String id;
  final String title;
  final IconData icon;
  final List<SubService> sub;
  const ServiceCategory(this.id, this.title, this.icon, this.sub);
}

const List<ServiceCategory> serviceCategories = [
  ServiceCategory('found', 'تأسيس سجل تجاري', Icons.apartment_rounded, [
    SubService('مؤسسة فردية', '1–3 أيام', '45 د.ب'),
    SubService('شركة ذات مسؤولية محدودة (WLL)', '3–5 أيام', '120 د.ب'),
    SubService('شركة مساهمة خاصة (BSC Closed)', '5–7 أيام', '250 د.ب'),
    SubService('فرع شركة أجنبية', '5–10 أيام', '300 د.ب'),
    SubService('شركة تضامن أو توصية', '3–5 أيام', '90 د.ب'),
  ]),
  ServiceCategory('amend', 'تعديلات السجل التجاري', Icons.edit_document, [
    SubService('تغيير اسم النشاط', '2–3 أيام', '35 د.ب'),
    SubService('إضافة نشاط تجاري', '1–3 أيام', '30 د.ب'),
    SubService('نقل ملكية السجل', '3–5 أيام', '80 د.ب'),
    SubService('إضافة / حذف شريك', '3–5 أيام', '70 د.ب'),
    SubService('تجديد السجل التجاري', 'يوم واحد', '25 د.ب'),
  ]),
  ServiceCategory('vio', 'رفع وإزالة المخالفات', Icons.warning_amber_rounded, [
    SubService('رفع مخالفة انتهاء صلاحية السجل', '1–2 يوم', '40 د.ب'),
    SubService('إزالة مخالفة نشاط غير مرخص', '3–5 أيام', '65 د.ب'),
    SubService('إزالة الإيقاف الإداري', '3–7 أيام', '90 د.ب'),
  ]),
  ServiceCategory('gov', 'الطلبات الحكومية', Icons.assignment_rounded, [
    SubService('شهادة السجل التجاري', 'نفس اليوم', '15 د.ب'),
    SubService('طلب عدم ممانعة (NOC)', '1–3 أيام', '35 د.ب'),
    SubService('التسجيل الضريبي (VAT)', '2–3 أيام', '40 د.ب'),
  ]),
  ServiceCategory('consult', 'استشارات وحل النزاعات', Icons.balance_rounded, [
    SubService('استشارة قانونية تجارية', 'خلال 24 ساعة', '30 د.ب'),
    SubService('مراجعة عقود الشراكة', '1–3 أيام', '60 د.ب'),
    SubService('تمثيل أمام الوزارة', 'حسب الجلسة', 'على حسب'),
  ]),
  ServiceCategory('search', 'بحث واستفسار (سجلات)', Icons.search_rounded, [
    SubService('البحث عن سجل تجاري', 'فوري', 'مجاناً'),
    SubService('التحقق من صحة السجل', 'فوري', 'مجاناً'),
  ]),
];
