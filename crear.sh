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
read global
# rationale: lowercase an first letter
global=$(echo "$global" | tr '[:upper:]' '[:lower:]' | head -c 1)
if [ "$global" = "y" ]; then
  APP_DIR='/usr/share/applications/'
  SUDO='sudo'
else
  APP_DIR="$HOME/.local/share/applications/"
  SUDO=''
fi

$SUDO tee ${APP_DIR}${nombreicono}.desktop << EOF
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=$nombre
GenericName=$nombre
Comment=$descripcion
Icon=$icono
Exec=$comando %F
Terminal=false
Categories=GTK;Application;
MimeType=application/x-shockwave-flash;
EOF
