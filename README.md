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

**1. Pembersihan dan Manipulasi Data menggunakan spreadsheet**

Adapun langkah-langkah yang dilakukan:
1. Membuka spreadsheet dan membuat kolom bernama ride_length.
2. Menghitung durasi setiap perjalanan dengan mengurangi kolom start_time dari kolom end_time (misalnya, =C2-B2)
3. Memformat sebagai HH:MM:SS menggunakan Format > Cels > Time > 37:30:55. 
4. Membuat kolom bernama day_of_week, dan menghitung hari dalam seminggu saat setiap perjalanan dimulai menggunakan perintah WEEKDAY (misalnya, =WEEKDAY(C2,1)) di setiap file.
5. Memformat sebagai General atau sebagai angka tanpa desimal, bahwa 1 = Minggu dan 7 = Sabtu. 

Langkah-langkah memriksa dan menangani data kosong:
1. Gunkan filter untuk memfilter data
2. Kemudian memeriksa apakah terdapat data "Blank"
3. Pada data [Divvy 2020 Q1](https://docs.google.com/spreadsheets/d/179QVLO_yu5BJEKFVZShsKag74ZaUYIF6FevLYzs3hRc/template/preview#gid=640449855), terdapat satu baris dengan beberepa nilai variabel yang kosong, yaitu pada kolom end_station_name, end_station_id, end_lat, dan end_lng. Setelah diperiksa nilai pada variabel started_at dan variabel ended_at pada baris tersebut menunjukkan waktu yang sama, yang berarti sepeda tidak jadi digunakan. Maka variabel-variabel yang kosong tersebut diisi dengan nilai yang terdapat pada variabel start_station_name, start_station_id, start_lat, dan start_lng.
4. Pada data [Divvy 2019 Q1](https://docs.google.com/spreadsheets/d/1uCTsHlZLm4L7-ueaSLwDg0ut3BP_V4mKDo2IMpaXrk4/template/preview?resourcekey=0-dQAUjAu2UUCsLEQQt20PDA#gid=1797029090), pada kolom gender dan birtyear terdapat beberapa baris data yang kosong. Untuk kasus ini data yang kosong akan dibiarkan, karena pada analysis data yang akan dilakukan tidak akan digunakan variabel gender dan tahun lahir pengguna.

Langkah-langkah mengurutkan data:
1. Gunakan fungsi short untuk mengurutkan data
2. Data diurutkan berdasarkan variabel tanggal start, dari tanggal terkecil ke terbesar
