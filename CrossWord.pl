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
    send(Window, size, size(720, 720)),

    set_horizontal_container(Window),
    set_vertical_container(Window),

    % Agregar el contenedor para el crucigrama
    send(Window, append, new(CrossWord, dialog_group(crossWord))),
    send(CrossWord, width, 640),
    send(CrossWord, height, 480),

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
        %1
        add_label(CrossWord, '1', 190, 55),
        create_cell(CrossWord,200,50),
        create_cell(CrossWord,240,50),
        create_cell(CrossWord,280,50),
        create_cell(CrossWord,320,50),
        create_cell(CrossWord,360,50),
        create_cell(CrossWord,400,50),
        create_cell(CrossWord,440,50),
        %7
        add_label(CrossWord, '7', 220, 30),
        create_cell(CrossWord,200,90),
        create_cell(CrossWord,200,130),
        create_cell(CrossWord,200,170),
        create_cell(CrossWord,200,210),
        create_cell(CrossWord,200,250),
        %9
        add_label(CrossWord, '9', 420, 30),
        create_cell(CrossWord,400,50),
        create_cell(CrossWord,400,90),
        create_cell(CrossWord,400,130),
        create_cell(CrossWord,400,170),
        create_cell(CrossWord,400,210),
        create_cell(CrossWord,400,250),
        create_cell(CrossWord,400,290),
        %3
        add_label(CrossWord, '3', 310, 295),
        create_cell(CrossWord,320,290),
        create_cell(CrossWord,360,290),
        create_cell(CrossWord,440,290),
        create_cell(CrossWord,480,290),
        create_cell(CrossWord,520,290),
        %8
        add_label(CrossWord, '8', 340, 150),
        create_cell(CrossWord,320,170),
        create_cell(CrossWord,320,210),
        create_cell(CrossWord,320,250),
        create_cell(CrossWord,320,330),
        create_cell(CrossWord,320,370),
        create_cell(CrossWord,320,410),
        %5
        add_label(CrossWord, '5', 310, 415),
        create_cell(CrossWord,360,410),
        create_cell(CrossWord,400,410),
        create_cell(CrossWord,440,410),
        create_cell(CrossWord,480,410),
        create_cell(CrossWord,520,410),
        %10
        add_label(CrossWord, '10', 535, 30),
        create_cell(CrossWord,520,50),
        create_cell(CrossWord,520,90),
        create_cell(CrossWord,520,130),
        create_cell(CrossWord,520,170),
        create_cell(CrossWord,520,210),
        create_cell(CrossWord,520,250),
        create_cell(CrossWord,520,330),
        create_cell(CrossWord,520,370),
        %2
        add_label(CrossWord, '2', 30, 175),
        create_cell(CrossWord,40,170),
        create_cell(CrossWord,80,170),
        create_cell(CrossWord,120,170),
        create_cell(CrossWord,160,170),
        create_cell(CrossWord,200,170),
        create_cell(CrossWord,240,170),
        %6
        add_label(CrossWord, '6', 140, 110),
        create_cell(CrossWord,120,130),
        create_cell(CrossWord,120,210),
        create_cell(CrossWord,120,250),
        create_cell(CrossWord,120,290),
        create_cell(CrossWord,120,330),
        create_cell(CrossWord,120,370),
        %4
        add_label(CrossWord, '4', 30, 335),
        create_cell(CrossWord,40,330),
        create_cell(CrossWord,80,330),
        create_cell(CrossWord,160,330),
        create_cell(CrossWord,200,330),
        create_cell(CrossWord,240,330).



% Predicado para agregar un label en una posición dada
add_label(Window, Text, PosX, PosY) :-
    new(Label, label(nombre_label, Text)),
    send(Window, append, Label),
    send(Window, display,Label, point(PosX, PosY)).




        


create_cell(CrossWord, X,Y) :-
    new(Cell, text_item('')),
        send(Cell, length, 1),  
        send(Cell, width, 3),
        send(CrossWord, append, Cell),
        send(CrossWord, display,Cell, point(X, Y)).


