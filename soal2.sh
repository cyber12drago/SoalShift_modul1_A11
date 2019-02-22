awk 'BEGIN{printf "Penjualan Negara\n" }'
awk -F "\"*,\"*" '$7=="2012"{print} ' WA_Sales_Products_2012-14.csv | sort | awk -F, '{arr[$1]+=$10;}END{for (i in arr)print arr[i]"\t  "i;}' | sort -k1 -nr | head -1
awk 'BEGIN{printf "\nPenjualan Product Line\n" }'
awk -F "\"*,\"*" '($7=="2012") && ($1=="United States"){print}' WA_Sales_Products_2012-14.csv | sort | awk -F, '{arr[$4]+=$10;}END{for (i in arr)print arr[i]"\t  "i;}' | sort -k1 -nr | head -3
awk 'BEGIN{printf "\nPenjualan Product\n" }'
awk -F "\"*,\"*" '($1=="United States") && ($7=="2012") && $($1=="Personal Accessories" || $3=="Camping Equipment" || $3=="Outdoor Protection"){print}' WA_Sales_Products_2012-14.csv | sort  | awk -F, '{arr[$6]+=$10;}END{for (i in arr)print arr[i]"\t  " i;}' | sort -k1 -nr | head -3




