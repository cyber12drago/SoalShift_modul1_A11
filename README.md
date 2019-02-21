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
