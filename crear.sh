#!/bin/bash
echo 'Bienvenido al creador de lanzadores para GNOME'
echo 'Ingrese algunos datos...'
echo 'El nombre de la aplicación:'
read nombre
echo 'Descripción de la aplicación:'
read descripcion
echo 'Comando, ruta de la aplicación [absoluta]:'
read comando
echo 'Ruta del icono (png,jpg,xpm) [absoluta]:'
read icono
# rationale: lowercase
nombreicono=$(echo "$nombre" | tr '[:upper:]' '[:lower:]' | sed 's/\ /-/g')
echo '¿Quiere que los demás usuarios accedan al lanzador?: (y/n)'
read local
# rationale: lowercase an first letter
local=$(echo "$local" | tr '[:upper:]' '[:lower:]' | head -c 1)
if [ "$local" = "y" ]; then
  APP_DIR='~/.local/share/applications/'
  SUDO=''
else
  APP_DIR='/usr/share/applications/'
  SUDO='sudo'
fi

$SUDO tee ${APP_DIR}${nombreicono}.desktop << EOF
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
