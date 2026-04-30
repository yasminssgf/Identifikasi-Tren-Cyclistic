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

Merupakan data perjalanan historis Cyclistic untuk menganalisis dan mengidentifikasi tren, yang merupakan data publik. Dataset yang digunakan, yaitu [Divvy 2019 Q1](https://docs.google.com/spreadsheets/d/1uCTsHlZLm4L7-ueaSLwDg0ut3BP_V4mKDo2IMpaXrk4/template/preview?resourcekey=0-dQAUjAu2UUCsLEQQt20PDA#gid=1797029090) dan [Divvy 2020 Q1](https://docs.google.com/spreadsheets/d/179QVLO_yu5BJEKFVZShsKag74ZaUYIF6FevLYzs3hRc/template/preview#gid=640449855).

**1. Pembersihan dan Manipulasi Data**

Adapun langkah-langkah yang dilakukan:
1. Membuka spreadsheet dan membuat kolom bernama ride_length.
2. Menghitung durasi setiap perjalanan dengan mengurangi kolom start_time dari kolom end_time (misalnya, =C2-B2)
3. Memformat sebagai HH:MM:SS menggunakan Format > Number > Duration > 37:30:55. 
4. Membuat kolom bernama day_of_week, dan menghitung hari dalam seminggu saat setiap perjalanan dimulai menggunakan perintah WEEKDAY (misalnya, =WEEKDAY(C2,1)) di setiap file.
5. Memformat sebagai General atau sebagai angka tanpa desimal, bahwa 1 = Minggu dan 7 = Sabtu. 

