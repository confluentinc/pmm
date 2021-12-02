. ./env.sh
. ./keys.sh
cat templates/dr-link.config.in | sed -e "s^LINK_API_KEY^$LINK_API_KEY^g" \
                            -e "s^LINK_API_SECRET^$LINK_API_SECRET^g" > dr-link.config 

