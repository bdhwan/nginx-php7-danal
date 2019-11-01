#!/bin/bash
echo "GIT_URL: "$GIT_URL
git clone "$GIT_URL"
echo 'done clone'

rm -rf /var/www/html

mv "$(basename "$GIT_URL" .git)" /var/www/html

cd /var/www/html/card/inc
ls
echo 'will set env'

# sed -i -e "s/vvDN_CREDIT_URL/"$DN_CREDIT_URL"/g" conf.php
sed -i -- 's#vvDN_CREDIT_URL#'"$DN_CREDIT_URL"'#g' conf.php

# sed -i -e "s/vvPI_SERVER/"$API_SERVER"/g" conf.php
sed -i -- 's#vvPI_SERVER#'"$API_SERVER"'#g' conf.php

# sed -i -e "s/vvUSER_SERVER_URL/"$USER_SERVER_URL"/g" conf.php
sed -i -- 's#vvUSER_SERVER_URL#'"$USER_SERVER_URL"'#g' conf.php

# sed -i -e "s/vvRETURNURL/"$RETURNURL"/g" conf.php
sed -i -- 's#vvRETURNURL#'"$RETURNURL"'#g' conf.php

# sed -i -e "s/vvCANCELURL/"$CANCELURL"/g" conf.php
sed -i -- 's#vvCANCELURL#'"$CANCELURL"'#g' conf.php

# sed -i -e "s/vvCPID/"$CPID"/g" conf.php
sed -i -- 's#vvCPID#'"$CPID"'#g' conf.php

# sed -i -e "s/vvCRYPTOKEY/"$CRYPTOKEY"/g" conf.php
sed -i -- 's#vvCRYPTOKEY#'"$CRYPTOKEY"'#g' conf.php

# sed -i -e "s/vvIVKEY/"$IVKEY"/g" conf.php
sed -i -- 's#vvIVKEY#'"$CRYPTOKEY"'#g' conf.php

echo 'done set env'


cd /var/www/html
service php7.0-fpm start && nginx -g 'daemon off;'

