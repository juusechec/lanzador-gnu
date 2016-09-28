#!/bin/bash
echo 'El nombre de la aplicación:'
read nombre
echo 'La descripción:'
read descripcion
echo 'Ruta icono:'
read icono
echo 'Comando:'
read comando
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
Categories=GTK;Application;AudioVideo;Video;Player;
MimeType=application/x-shockwave-flash;
EOF
