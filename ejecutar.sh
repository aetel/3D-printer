if [ "$USER" != "root" ]; then
	if [ "$LANG" == "es_ES.UTF-8" ] || [ "$LANG" == "es_ES.ISO-8859-1" ] || [ "$LANG" == "es_ES.ISO-8859-15" ]; then
		echo "Escriba su contraseña de root y vuelva a ejecutar este script"
	else
		echo "Type your root password and execute this script again"
	fi
	su 
else
	if [ "$LANG" == "es_ES.UTF-8" ] || [ "$LANG" == "es_ES.ISO-8859-1" ] || [ "$LANG" == "es_ES.ISO-8859-15" ]; then
		echo "¿Quiere añadir un acceso directo para poder abrir Pronterface? [Y/n]"
		rm /usr/share/applications/pronterface.desktop
		read acceso_pronterface
		if [ "$acceso_pronterface" == "Y" ]; then
		echo "Escriba el nombre de la imagen que quiera usar para abrir Pronterface (Ej: imagen.png .Si no está en la misma carpeta que este fichero ejecutable, ponga la ruta completa.)"
		echo "Tenga en cuenta que el formato de imagen debe ser PNG"
		fi
	else
		echo "Would you like to add a link to open Pronterface? [Y/n]"
		rm /usr/share/applications/pronterface.desktop
		read acceso_pronterface
		if [ "$acceso_pronterface" == "Y" ]; then
		echo "Write the name of the image you want to use to open Pronterface (e.g. image.png .If it is not in the same folder as this sh file, type the whole path)"
		echo "Take into account that the image format must be PNG"	
		fi
	fi
	if [ "$acceso_pronterface" == "Y" ]; then
		read nombre_imagen_pronterface	
		mv $nombre_imagen_pronterface /usr/share/icons/gnome
		echo '[Desktop Entry]' >> /usr/share/applications/pronterface.desktop	
		echo 'Type=Application' >> /usr/share/applications/pronterface.desktop
		echo 'Version=1.0' >> /usr/share/applications/pronterface.desktop
		echo 'Encoding=UTF-8' >> /usr/share/applications/pronterface.desktop
		echo 'Name=Pronterface' >> /usr/share/applications/pronterface.desktop
		echo Icon=/usr/share/icons/gnome/$nombre_imagen_pronterface >> /usr/share/applications/pronterface.desktop
		if [ "$LANG" == "es_ES.UTF-8" ] || [ "$LANG" == "es_ES.ISO-8859-1" ] || [ "$LANG" == "es_ES.ISO-8859-15" ]; then
			echo "Escriba la ruta completa al fichero 'pronterface.py' (Ej: /opt/Printrun/pronterface.py)"
		else
			echo "Type the whole path to 'pronterface.py' file (Eg: /opt/Printrun/pronterface.py)"
		fi
		read ruta_pronterface
		echo Exec=python $ruta_pronterface >> /usr/share/applications/pronterface.desktop
		echo 'Terminal=YES' >> /usr/share/applications/pronterface.desktop
	fi
	if [ "$LANG" == "es_ES.UTF-8" ] || [ "$LANG" == "es_ES.ISO-8859-1" ] || [ "$LANG" == "es_ES.ISO-8859-15" ]; then
		echo "¿Quiere añadir un acceso directo para poder abrir Slic3r? [Y/n]"
		rm /usr/share/applications/slic3r.desktop
		read acceso_slic3r
		if [ "$acceso_slic3r" == "Y" ]; then
		echo "Escriba el nombre de la imagen que quiera usar para abrir Slic3r (Ej: imagen.png .Si no está en la misma carpeta que este fichero ejecutable, ponga la ruta completa)"
		echo "Tenga en cuenta que el formato de imagen debe ser PNG"
		fi
	else
		echo "Would you like to add a link to open Slic3r? [Y/n]"
		read acceso_slic3r
		rm /usr/share/applications/slic3r.desktop
		if [ "$acceso_slic3r" == "Y" ]; then
		echo "Write the name of the image you want to use to open Slic3r (e.g. image.png .If it is not in the same folder as this sh file, type the whole path)"
		echo "Take into account that the image format must be PNG"
		fi
	fi
	if [ "$acceso_slic3r" == "Y" ]; then
		read nombre_imagen_slic3r
		mv $nombre_imagen_slic3r /usr/share/icons/gnome
		echo '[Desktop Entry]' >> /usr/share/applications/slic3r.desktop
		echo 'Type=Application' >> /usr/share/applications/slic3r.desktop	
		echo 'Version=1.0' >> /usr/share/applications/slic3r.desktop
		echo 'Encoding=UTF-8' >> /usr/share/applications/slic3r.desktop
		echo 'Name=Slic3r' >> /usr/share/applications/slic3r.desktop
		echo Icon=/usr/share/icons/gnome/$nombre_imagen_slic3r >> /usr/share/applications/slic3r.desktop
		if [ "$LANG" == "es_ES.UTF-8" ] || [ "$LANG" == "es_ES.ISO-8859-1" ] || [ "$LANG" == "es_ES.ISO-8859-15" ]; then
			echo "Escriba la ruta completa al fichero 'slic3r.pl' (Ej: /opt/Slic3r/slic3r.pl)"
		else
			echo "Type the whole path to 'slic3r.pl' file (Eg: /opt/Printrun/pronterface.py)"
		fi
		read ruta_slic3r
		echo Exec=$ruta_slic3r >> /usr/share/applications/slic3r.desktop
		echo 'Terminal=YES' >> /usr/share/applications/slic3r.desktop
	fi
fi
