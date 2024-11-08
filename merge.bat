git checkout develop
:: Solicitar mensaje de commit
set /p branch="Ingresa la rama para hacer merge: "

:: Ejecutar commit con el mensaje proporcionado
git merge origin "%branch%"