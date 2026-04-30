# Identifikasi Tren Cyclistic
Proyek ini merupakan proyek akhir dari program sertifikasi Data Analytics yang diadakan oleh Coursera. Proyek ini akan mengolah data sebuah perusahaan fiktif, Cyclistic. Cyclistic merupakan sebuah perusahaan berbagi sepeda di Chicago. Proyek ini akan merancang strategi pemasaran yang bertujuan untuk mengubah pengendara kasual menjadi anggota tahunan.

**Tujuan**

* Untuk lebih memahami bagaimana anggota tahunan dan pengendara kasual berbeda
* Untuk mengetahui mengapa pengendara kasual membeli keanggotaan
* Untuk mengetahui bagaimana media digital dapat memengaruhi taktik pemasaran
* Dan menganalisis data perjalanan sepeda Cyclistic historis untuk mengidentifikasi tren

**Tiga pertanyaan akan memandu program pemasaran di masa mendatang:**
1. Bagaimana anggota tahunan dan pengendara kasual menggunakan sepeda Cyclistic secara 
berbeda? 
2. Mengapa pengendara kasual membeli keanggotaan tahunan Cyclistic? 
3. Bagaimana Cyclistic dapat menggunakan media digital untuk memengaruhi pengendara 
kasual agar menjadi anggota?

**Data yang digunakan**
Merupakan data perjalanan historis Cyclistic untuk menganalisis dan mengidentifikasi tren, yang merupakan data publik. https://divvy-tripdata.s3.amazonaws.com/index.html  ini? Apakah data Anda ROCCC? 

**1. Pembersihan dan Manipulasi Data**
Adapun langkah-langkah yang dilakukan:
1. Membuka spreadsheet dan membuat kolom bernama ride_length.
2. Menghitung durasi setiap perjalanan dengan mengurangi kolom started_at dari kolom ended_at (misalnya, =D2-C2)
3. Memformat sebagai HH:MM:SS menggunakan Format > Cels > Time > 37:30:55. 
4. Membuat kolom bernama day_of_week, dan menghitung hari dalam seminggu saat setiap perjalanan dimulai menggunakan perintah WEEKDAY (misalnya, =WEEKDAY(C2,1)) di setiap file.
5. Memformat sebagai General atau sebagai angka tanpa desimal, bahwa 1 = Minggu dan 7 = Sabtu. 

