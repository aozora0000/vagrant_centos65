#/bin/sh
sed -i -e "s/u'/'/g" /usr/share/nginx/ansible.json
sed -i -e "s/'/\"/g" /usr/share/nginx/ansible.json
sed -i -e "s/False/\"False\"/g" /usr/share/nginx/ansible.json
sed -i -e "s/True/\"True\"/g" /usr/share/nginx/ansible.json
sed -i -e "s/\"\"False\"\"/\"False\"/g" /usr/share/nginx/ansible.json
sed -i -e "s/\"\"True\"\"/\"True\"/g" /usr/share/nginx/ansible.json
sed -i -e 's/"([0-9]+)"/$1/g' /usr/share/nginx/ansible.json
