:- use_module(library(pce)).

matriz([[1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]]).


% Interfaz principal del juego
start :-
    % Crear la ventana principal
    new(Window, dialog('Juego de Crucigrama')),
     send(Window, size, size(350, 600)),
    % Crear un contenedor horizontal para los textos
    send(Window, append, new(HBox, dialog_group(horizontal))),
    % Agregar el primer texto
    send(HBox, append, new(_, text('Crucigrama 3x3'))),
    % Agregar el segundo texto al lado
    send(HBox, append, new(_, text('1. Isma Pelon'))),
    % Crear el botón de verificación
    % Abrir la ventana

    send(Window, append, new(VBox, dialog_group(vertical))),
    % Agregar el primer texto
    send(VBox, append, new(_, text('Crucigsdsacdsarama 3x3'))),
    % Agregar el segundo texto al lado
    send(VBox, append, new(_, text('1. dIsma Pelon'))),

    % Llamar a la función que agregará los campos de text dinámicamente
    
    agregar_textos(HBox, 1),  % Por ejemplo, agregar 5 campos de texto


    send(Window, open).

% Función recursiva para agregar los campos de texto
agregar_textos(_, 6).  % Caso base: cuando se ha agregado el número de elementos deseado

agregar_textos(Window, N) :-
    N < 6,
    new(NameField, text_item(N)),  % Crear el campo de texto
    send(NameField, width, 10),  % Cambiar el ancho del campo de texto
    send(NameField, height, 30),  % Cambiar la altura del campo de texto
    send(Window, append, NameField), 
    N1 is N + 1,
    agregar_textos(Window, N1).  % Llamada recursiva para agregar el siguiente campo