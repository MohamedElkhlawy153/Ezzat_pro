# استخدام صورة أساسية مع Java
FROM eclipse-temurin:17-jdk

# نسخ ملفات المشروع إلى الصورة
COPY . /Project

# تحديد مجلد العمل
WORKDIR /Project

# تثبيت Ignition Gateway (استبدل الرابط بالإصدار المناسب)
RUN  curl -O https://files.inductiveautomation.com/release/ia/8.1.30/20230217-1311/ignition-gateway-8.1.30.zip \
    && unzip ignition-gateway-8.1.30.zip \
    && rm ignition-gateway-8.1.30.zip

# فتح المنفذ 8088
EXPOSE 8088

# تشغيل Ignition عند بدء الحاوية
CMD ["./ignition-gateway/ignition.sh", "start"]
