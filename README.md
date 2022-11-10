1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateful widget meruapakan widget yang dapat mengupdate tampilan, merubah warna, menambah jumlah baris dll. Sedangkan Stateful Widget merupakan widget yang dinamis atau dapat berubah. Sehingga dapat disimpulkan bahwa apapun widget yang dapat berubah maka itulah stateful widget. Stateless widget adalah widget yang tidak dapat berubah atau dapat kita sebut immutable. Penampilan serta propertinya tidak berubah selama widget itu masih ada. Stateless widget ini adalah STATIK. Sebagai contoh yaitu Text, Icon, dan RaisedButton. Dan Widget ini juga tidak bergantung pada perubahan data atau perilaku app.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
 
FloatingActionButton : Widget Untuk menampilkan button yang berada di index paling dekat dengan surface

Text : Widget untuk menampilkan text

Row : membuat element dalam 1 row

Icon : Memberi icon ke sebuah elemen

Colum : membuat element didalamnya memiliki gap 1 column

Center : Meletakkan element container ke bagian tengah

Padding : Untuk pengukuran element

Scaffold: Untuk mengimplementasikan layout material design

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi dari setState() ini adalah memberikan informasi ke system ketika sebuah variable berubah dan kemudian system akan melakukan render ke part yang berubah. Setstate perlu digunakan ketika ada perubahan yang ingin ditampilkan pada UI. Variabel yang terdampak yaitu _counter, karena yang mengalami perubahan adalah counter. Lalu dari counter tersebut akan mengubah text yang sudah dibuat yakni ganjil / genap.

4. Jelaskan perbedaan antara const dengan final.
Keduanya merupakan variable yang tidak dapat diubah yaitu immutable. Tetapi const mempunyai perbedaan yaitu bersifat immutable sejak compile-time, sehingga object yang merupakan const dapat kita sebut deeply immutable, yaitu masing-masing atribut tidak dapat diubah sama sekali. Sedangkan final berfungsi untuk hardcode nilai yang tidak akan diubah. Best practice untuk menggunakan final yaitu saat kita tidak mengetahui nilai tersebut di compile-time.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Membuat flutter app
- Pada floatingActionButton saya menambahkan widget row
- Membuat button yang berfungsi untuk melakukan decrement
- Membuat function untuk decrement tersebut
- Memanggil function decrement yang sudah dibuat saat button decrement-nya dipencet
- Membuat conditional widget text untuk setiap counter yaitu genap atau ganjil
- (Bonus) Membuat conditional agar button decrement-nya hanya bisa muncul saat counter tersebut lebih besar dari 0, sehingga apabila counter sedang 0 maka button decrement tersebut akan hilang
