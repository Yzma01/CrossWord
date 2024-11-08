:- use_module(library(pce)).

matriz([[1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]]).

h_hints(
    ["1. No es grande ni pequeno",
     "2. Dia de la semana",
     "3. Indiferencia, desgracia, desprecio",
     "4. Parte de un libro",
     "5. Escucha un programa de radio"]
).

v_hints(
    ["6. Lugar para ir a comprar",
     "7. Juguete",
     "8. Derretido, fusionado",
     "9. Dos, tres, cuatro, cinco",
     "10. Se hace mas joven"]
).

% Interfaz principal del juego
start :-
    new(Window, dialog('Juego de Crucigrama')),
    send(Window, size, size(900, 600)),

    set_horizontal_container(Window),
    set_vertical_container(Window),

    % Agregar el contenedor para el crucigrama
    send(Window, append, new(CrossWord, dialog_group(crossWord))),
    send(CrossWord, width, 700),
    send(CrossWord, height, 400),

    % Crear la matriz del crucigrama
    create_crossWord(CrossWord),
    

    send(Window, append, new(HInputs, dialog_group(inputsH))),
    add_inputH(HInputs, 1, 50),
    send(Window, append, new(VInputs, dialog_group(inputsV)), right),
    add_inputV(VInputs, 6, 50),

    send(Window, open).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set_horizontal_container(Window) :-
    send(Window, append, new(HBox, dialog_group(horizontal))),
    h_hints(Hints),
    add_text_to_container(HBox, Hints).

set_vertical_container(Window) :-
    send(Window, append, new(VBox, dialog_group(vertical)), right),
    v_hints(HintsV),
    add_text_to_container(VBox, HintsV).

add_text_to_container(_, []). % Caso base, lista vacía
add_text_to_container(Contenedor, [Texto | Resto]) :-
    send(Contenedor, append, new(_, text(Texto))),
    add_text_to_container(Contenedor, Resto).

% Añade los inputs del las opciones horizontal
add_inputH(_, 6, _). % Caso base, N == 6
add_inputH(HInputs, N, PosX) :-
    N < 6,
    new(NameField, text_item(N)),
    send(NameField, width, 10),
    send(HInputs, append, NameField),

    new(GetButton, button('Obtener',
        message(@prolog, obtener_info, NameField))),
    send(GetButton, position, point(PosX + 10, 100)),
    send(HInputs, append, GetButton, right),

    N1 is N + 1,
    NewPosX is PosX + 120,
    add_inputH(HInputs, N1, NewPosX).

% Añade los inputs del las opciones vertical
add_inputV(_, 11, _). % Caso base, N == 11
add_inputV(VInputs, N, PosX) :-
    N < 11,
    new(NameField, text_item(N)),
    send(NameField, width, 10),
    send(VInputs, append, NameField),

    new(GetButton, button('Obtener',
        message(@prolog, obtener_info, NameField))),
    send(GetButton, position, point(PosX + 10, 100)),
    send(VInputs, append, GetButton, right),

    N1 is N + 1,
    NewPosX is PosX + 120,
    add_inputV(VInputs, N1, NewPosX).


% Acción para obtener la información de un campo de texto
obtener_info(NameField) :-
    get(NameField, selection, Selection),
    format('Información del campo: ~w\n', [Selection]).


create_crossWord(CrossWord) :-
        create_cell(CrossWord,200,100).


create_cell(CrossWord, X,Y) :-
    new(Cell, text_item('')),
        send(Cell, length, 1),  
        send(Cell, width, 3),
        send(CrossWord, append, Cell),
        send(CrossWord, display,Cell, point(X, Y)).


