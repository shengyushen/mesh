echo -n "dp 1 "; cat dp1*.log|awk -F, '{if($1 ~ /^[0-9\.]+$/) {ssy=$1}} END{print ssy}'
echo -n "dp 2 "; cat dp2*.log|awk -F, '{if($1 ~ /^[0-9\.]+$/) {ssy=$1}} END{print ssy}'
echo -n "dp 4 "; cat dp4*.log|awk -F, '{if($1 ~ /^[0-9\.]+$/) {ssy=$1}} END{print ssy}'
echo -n "dp 8 "; cat dp8*.log|awk -F, '{if($1 ~ /^[0-9\.]+$/) {ssy=$1}} END{print ssy}'


echo -n "mp 2 "; cat mp2*.log|awk -F, '{if($1 ~ /^[0-9\.]+$/) {ssy=$1}} END{print ssy}'
echo -n "mp 4 "; cat mp4*.log|awk -F, '{if($1 ~ /^[0-9\.]+$/) {ssy=$1}} END{print ssy}'
echo -n "mp 8 "; cat mp8*.log|awk -F, '{if($1 ~ /^[0-9\.]+$/) {ssy=$1}} END{print ssy}'

