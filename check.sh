#!/bin/bash
echo "GIT_URL: "$GIT_URL
git clone "$GIT_URL"
echo 'done clone'

rm -rf /var/www/html

mv "$(basename "$GIT_URL" .git)" /var/www/html

cd /var/www/html/card/inc
ls
echo 'will set env'

sed -i -e "s/vvDN_CREDIT_URL/"$DN_CREDIT_URL"/g" conf.php
sed -i -- 's#vvDN_CREDIT_URL#'"$DN_CREDIT_URL"'#g' conf.php

sed -i -e "s/vvPI_SERVER/"$API_SERVER"/g" conf.php
sed -i -- 's#vvPI_SERVER#'"$API_SERVER"'#g' conf.php

sed -i -e "s/vvUSER_SERVER_URL/"$USER_SERVER_URL"/g" conf.php
sed -i -- 's#vvUSER_SERVER_URL#'"$USER_SERVER_URL"'#g' conf.php

sed -i -e "s/vvRETURNURL/"$RETURNURL"/g" conf.php
sed -i -- 's#vvRETURNURL#'"$RETURNURL"'#g' conf.php

sed -i -e "s/vvCANCELURL/"$CANCELURL"/g" conf.php
sed -i -- 's#vvCANCELURL#'"$CANCELURL"'#g' conf.php

sed -i -e "s/vvCPID/"$CPID"/g" conf.php
sed -i -- 's#vvCPID#'"$CPID"'#g' conf.php

sed -i -e "s/vvCRYPTOKEY/"$CRYPTOKEY"/g" conf.php
sed -i -- 's#vvCRYPTOKEY#'"$CRYPTOKEY"'#g' conf.php

sed -i -e "s/vvIVKEY/"$IVKEY"/g" conf.php
sed -i -- 's#vvIVKEY#'"$CRYPTOKEY"'#g' conf.php

echo 'done set env'

VALUE1=http://111.22.33.4/test
VALUE2=${VALUE1//./\\.}  #”.” 을 “\.”으로 치환

sed -i -e "s/vvDN_CREDIT_URL/"${${DN_CREDIT_URL//./\\.}//\//\\/}"/g" conf.php

 sed -i -- 's#vvDN_CREDIT_URL#'"$DN_CREDIT_URL"'#g' conf.php

VALUE2=${ VALUE2//\//\\/}  #”/” 를 “\/” 으로 치환

sed -e 's/\/.*//' -e 's/ABC.*/ABC='${VALUE2}'/g' /etc/dimark/dimclient.conf ./test.conf > ./test.conf #정상적인 URL String이 추가된다.



출처: https://commable.tistory.com/entry/sed-사용-시-참고사항 [Lunatic World]


cd /var/www/html
service php7.0-fpm start && nginx -g 'daemon off;'

