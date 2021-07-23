#!/bin/bash

openssl req -x509 -newkey rsa:2048 -outform PEM -keyout PkKek1.private.key -out PkKek1.pem
sed -e 's/^-----BEGIN CERTIFICATE-----$/4e32566d-8e9e-4f52-81d3-5bb9715f9727:/' -e '/^-----END CERTIFICATE-----$/d' PkKek1.pem | tr -d '\n' > PkKek1.oemstr

OEMSTRING=$(<PkKek1.oemstr)

echo " "
echo "  - add this to the <os> block of your VM XML:"
echo "    <smbios mode='sysinfo'/>"
echo " "
echo " - add this to the <domain> block of your VM XML:"
echo "   (idealy directly before or after the <os> block)"
echo "   <sysinfo>"
echo "     <oemStrings>"
echo "       <entry>$OEMSTRING</entry>"
echo "     </oemStrings>"
echo "   </sysinfo>"
echo " "
echo " "
echo " /!\\ The <entry> line is ONE SINGLE LINE, no linebreaks!"
echo " "
