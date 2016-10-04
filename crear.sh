#!/bin/bash
echo 'El nombre de la aplicación:'
read nombre
echo 'Descripción de la aplicación:'
read descripcion
echo 'Comando, ruta aplicación [absoluta]:'
read comando
echo 'Ruta icono:'
read icono
nombreicono=$(echo "$nombre" | tr '[:upper:]' '[:lower:]' | sed 's/\ /-/g')
sudo tee /usr/share/applications/$nombreicono.desktop << EOF
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=$nombre
GenericName=$nombre
Comment=$descripcion
Icon=$icono
Exec=$comando
Terminal=false
Categories=GTK;Application;
MimeType=application/x-shockwave-flash;
EOF
