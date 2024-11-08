:: Añadir todos los cambios
git add .

:: Solicitar mensaje de commit
set /p commitMsg="Ingresa el mensaje de commit: "

:: Ejecutar commit con el mensaje proporcionado
git commit -m "%commitMsg%"

:: Hacer push al branch especificado
git push origin yzma