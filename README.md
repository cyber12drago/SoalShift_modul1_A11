Soal Shift Modul 1

Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut : a.	Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt 
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
<h2>Soal Nomor 2</h2>

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
<h2>Soal nomor 5</h2>

1. Read syslog lalu pipe
```
cat /var/log/syslog |
```
2. Tidak mengandung string "sudo" tetapi mengandung string "cron" dan "CRON" karena tidak case sensitive lalu redirect output ke ke /home/<user>/modul1/soal_5.log
```
awk '(/!sudo/ || /cron/ && /CRON/) && (NF<13){print}' >> /home/diondevara/modul1/soal_5.log
```
4. Setting cron
> 2-30/6 * * * * /bin/bash /home/diondevara/soal5.sh
