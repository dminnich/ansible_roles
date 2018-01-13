#!/bin/bash
OUT="/root/${1}.ovpn"
rm -f ${OUT}
cat /etc/openvpn/client-template >> ${OUT}
printf "<ca>\n" >> ${OUT}
cat /etc/openvpn/easy-rsa/pki/ca.crt >> ${OUT}
printf "</ca>\n<cert>\n" >> ${OUT}
cat /etc/openvpn/easy-rsa/pki/issued/${1}.crt >> ${OUT}
printf "</cert>\n<key>\n" >> ${OUT}
cat /etc/openvpn/easy-rsa/pki/private/${1}.key >> ${OUT}
printf "</key>\nkey-direction 1\n<tls-auth>\n" >> ${OUT}
cat /etc/openvpn/easy-rsa/pki/tls-auth.key >> ${OUT}
printf "</tls-auth>" >> ${OUT}
