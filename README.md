Tugas-7

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

Tugas-8

1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
Navigator.push adalah suatu navigator routing yang hanya akan menambahkan page pada top of stack -> Navigator.pushReplacement adalah suatu navigator routing yang bisa menghapus page paling atas, lalu navigator tersebut menambahkan page yang akan dirouting sehingga dia akan mengganti posisi page pada urutan top of stack menjadi page yang baru akan diroute. Dengan demikian, page yang terbaru akan menjadi top of stack)

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- drawer: drawer/hamburger
- DropDown: Widget interaktif yang bisa memiliki pilihan drop-down
- Padding: Widget styling, untuk padding sebuah widget lain
- Card: Layout widget, untuk menata isi-isinya (child)

3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- onPressed
- onChange
- onSaved
- onTap
- onLongPress
- onClick

4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Cara kerja Navigator ketika mengganti page dari aplikasi Flutter adalah dengan menggunakan mekanisme yang hampir mirip dengan prinsip stack. Page atau halaman akan dimuat dipush pada top of stack, sedangkan ketika ingin mengakses halaman sebelumnya, Navigator ini akan melakukan pop pada stack. Dengan demikian, page yang sedang dilihat saat ini akan dihapus dari stack lalu akan ditampilkan halaman sebelumnya pada pengguna.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Membuat file drawer yang berisi route untuk masing masing class untuk counter, showBudget, atau form.
- Membuat form dengan validation dan state
- File data akan diset untuk memiliki fungsi untuk menambahkan obj paada atribut classnya untuk menampung data yang diinput.
- Membuat showBudget dan melakukan loop dari ListBudget.len untuk diloop dan ditampilan sebagaimananya dengan Card view
