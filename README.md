# Soal Shift Modul 1
#

**Soal Nomor 1**
Hal pertama yang dilakukan adalah extract file nature.zip dengan command “unzip nature.zip”. Kemudian untuk setiap file .jpg yang ada, dilakukan decrypt dengan command base64 -d. Karena hasil decrypt merupakan suatu bilangan Hexadecimal, maka perlu diubah dengan command “xxd -r” (xxd sendiri merupakan kebalikan dari hexdump yang berfungsi untuk mengubah suatu konten file menjadi hexadecimal, octal, ASCII dan decimal. )

Kemudian juga perlu menambahkan schedule baru pada crontab. Format nya yaitu “14 14 14 2 * bash /home/gipen/Documents/icang/nature/soal1.sh”. Hal ini menunjukkan bahwa akan di-bash soal1.sh pada tanggal 14 Februari jam 14.14. Selain itu ditambahkan juga schedule “0 0 * 2 fri bash /home/gipen/Documents/icang/nature/soal1.sh”. Ini menunjukkan bahwa selain pada tanggal 14 Februari, soal1.sh juga akan di-bash pada setiap hari Jumat pada bulan Februari.

**Soal Nomor 2**
Membuat laporan berdasarkan file berdasarkan file WA_Sales_Products_2012-14.csv dengan menentukan:
- Negara dengan penjualan terbanyak di tahun 2012.
- Tiga product line yang memberikan penjualan terbanyak pada poin soal a.
- Tiga product yang memberikan penjualan terbanayak pada poin soal b.
**Bagian a**

1. Cari row yang memiliki tahun 2012 dari file lalu pipe
```
awk -F "\"*,\"*" '$7=="2012"{print} ' WA_Sales_Products_2012-14.csv |
```
2. Lakukan Sorting lalu pipe
```
sort |
```
3. Menjumlahkan penjualan tiap negara lalu pipe
```
awk -F, '{arr[$1]+=$10;}END{for (i in arr)print arr[i]"\t  "i;}' |
```
4. Sorting sesuai dengan jumlah penjualan lalu pipe
```
sort -k1 -nr |
```
5. Ambil yang paling besar
```
head -1
```
**Bagian b**

1. Cari row yang memiliki tahun 2012 dan negara United States sesuai soal a lalu pipe
```
awk -F "\"*,\"*" '($7=="2012") && ($1=="United States"){print}' WA_Sales_Products_2012-14.csv |
```
2. Lakukan Sorting lalu pipe
```
sort |
```
3. Menjumlahkan penjualan tiap product line lalu piple
```
awk -F, '{arr[$4]+=$10;}END{for (i in arr)print arr[i]"\t  "i;}' |
```
4. Sorting sesuai dengan jumlah penjualan lalu pipe
```
sort -k1 -nr |
```
5. Ambil 3 yang paling besar
```
head -3
```
**Bagian c**

1. Cari row yang memiliki tahun 2012,negara United States,dan product line:(Personal Accessories atau Camping Equipment atau Outdoor Protection) sesuai soal b lalu pipe
```
awk -F "\"*,\"*" '($1=="United States") && ($7=="2012") && $($1=="Personal Accessories" || $3=="Camping Equipment" || $3=="Outdoor Protection"){print}' WA_Sales_Products_2012-14.csv |
```
2. Lakukan Sorting lalu pipe
```
sort  |
```
3. Menjumlahkan penjualan tiap product lalu pipe 
```
awk -F, '{arr[$6]+=$10;}END{for (i in arr)print arr[i]"\t  " i;}' |
```
4. Sorting sesuai dengan jumlah penjualan lalu pipe
```
sort -k1 -nr |
```
5. Ambil 3 yang paling besar 
```
head -3
```

<h2>Soal nomor 3</h2>
3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut : a.	Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt 
b.	Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya. 
c.	Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus. 
d. Password yang dihasilkan tidak boleh sama.

```bash
#!/bin/bash

y=0
while [ $y -lt 3 ]
do
 let y=0
    passrandom=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

    if [[ "$passrandom" =~ [a-z] ]];
	then let y=$y+1;
    fi

    if [[ "$passrandom" =~ [A-Z] ]];
	then let y=$y+1;
    fi
    if [[ "$passrandom" =~ [0-9] ]];
	then let y=$y+1;
    fi

done
    echo "$passrandom"

    x=1
    z=1
    file=/home/cyber12drago/Documents/password
    while [ -s "$file$x.txt" ]
    do
          value=$(<$file$x.txt)
   		if test "$value" = "$passrandom"
		then let z=0;break;
		fi

	  let x=$x+1
    done
   
    if [ $z -eq 0 ]
    then echo "Coba lagi";
    else
	echo "$passrandom" > $file$x.txt  
    fi
```

- Dari Script bash diatas fungsi `passrandom=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)` untuk membuat kode acak yg terdiri dari huruf kecil,huruf panjang dan angka sepanjang 12
- Tetapi dari semua probabilitas kode acak diatas belum tentu memenuhi seperti kondisi diatas
- maka dari itu hasil 'passrandom' kita cek satu-satu apakah mengandung huruf kecil,huruf besar dan angka.
- Apabila tidak mengandung salah satu dari kondisi, maka kode akan diacak lagi sampai memenuhi 3 kondisi tersebut
- Jika berhasil maka kode diatas akan disimpan di password1.txt
- Tetapi jika password1.txt sudah terisi maka akan create password2.txt dan begitu seterusnya

<h2>Soal nomor 4</h2>

4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut: a.	Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14. b.	Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. c.	setelah huruf z akan kembali ke huruf a d.	Backup file syslog setiap jam. e. dan buatkan juga bash script untuk dekripsinya.

```bash
#!/bin/bash

lower=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
rotat=`date '+%H'`
jam=`date +%H`
jam=$(($jam-0))
menit=`date +%M`
menit=$(($menit-0))
tanggal=`date +%d`
bulan=`date +%m`
tahun=`date +%Y`


file="$jam:$menit $tanggal-$bulan-$tahun"

cat /var/log/syslog | tr "${lower:0:26}" "${lower:${rotat}:26}" | tr "${upper:0:26}" "${upper:${rotat}:26}" > "$file.txt"
```

- Variable lower dan upper berguna untuk menjadi tempat shift letternya
- Untuk variable jam dan menit diubah ke integer untuk menghindari error token 01-09
- Variable file digunakan sebagai nama tempat hasil shift letter
- `cat /var/log/syslog` digunakan untuk menjadi file yg akan diubah
- `tr "${lower:0:26}" "${lower:${rotat}:26}" | tr "${upper:0:26}" "${upper:${rotat}:26}"` digunakan untuk melakukan shift letter yang berada di syslog
- Buatlah file sh lagi untuk mendecrypt lagi
- crontab yang digunakan adalah `* 1 * * *` karena akan digunakan setiap jam
![Image Description](crontab.jpg)


``` bash
#!/bin/bash

lower=zyxwvutsrqponmlkjihgfedcbazyxwvutsrqponmlkjihgfedcba
upper=ZYXWVUTSRQPONMLKJIHGFEDCBAZYXWVUTSRQPONMLKJIHGFEDCBA
rotat=`date '+%H'`

read x
cat "$x" | tr "${lower:0:26}" "${lower:${rotat}:26}" | tr "${upper:0:26}" "${upper:${rotat}:26}" > "$x-description.txt"
```


**Soal nomor 5**
Membuat script bash untuk menyimpan syslog dengan kriteria:
- Tidak mengandung string "sudo".
- Pencarian string tidak bersifat case sensitive.
- Jumlah field pada baris kurang dari 13.
- Record dimasukkan dalam file logs pada direktori /home/[user]/modul1.
- Menjalankan script setiap 6 menit dari menit ke 2 hingga 30.
1. Read syslog lalu pipe
```
cat /var/log/syslog |
```
2. Tidak mengandung string "sudo" tetapi mengandung string "cron" dan "CRON" karena tidak case sensitive lalu redirect output ke ke /home/<user>/modul1/soal_5.log
```
awk '(/!sudo/ || /cron/ && /CRON/) && (NF<13){print}' >> /home/diondevara/modul1/soal_5.log
```
4. Setting cron
```
2-30/6 * * * * diondevara /home/diondevara/soal5.sh
```
