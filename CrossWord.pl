:- use_module(library(pce)).

:- dynamic cell/1.  % Declaración dinámica para almacenar las celdas

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

    % Agregar el contenedor para el crucigrama
    send(Window, append, new(CrossWord, dialog_group(crossWord))),
    send(CrossWord, width, 640),
    send(CrossWord, height, 480),

    % Crear la matriz del crucigrama
    create_crossWord(CrossWord),

    set_buttons(Window),
    set_horizontal_container(Window),
    set_vertical_container(Window),

    send(Window, open).

set_horizontal_container(Window) :-
    send(Window, append, new(HBox, dialog_group(horizontal))),
    send(Window, display, HBox, point(50, 550)),
    h_hints(Hints),
    add_text_to_container(HBox, Hints).

set_vertical_container(Window) :-
    send(Window, append, new(VBox, dialog_group(vertical))),
    send(Window, display, VBox, point(350, 550)),
    v_hints(HintsV),
    add_text_to_container(VBox, HintsV).

add_text_to_container(_, []). % Caso base, lista vacía
add_text_to_container(Contenedor, [Texto | Resto]) :-
    send(Contenedor, append, new(_, text(Texto))),
    add_text_to_container(Contenedor, Resto).

% Añade los inputs del las opciones horizontal
set_buttons(Window) :-
    new(VerifyButton, button('Verificar', message(@prolog, verificar))),
    send(VerifyButton, width, 100),
    send(VerifyButton, height, 50),
    send(VerifyButton, position, point(150, 600)),
    send(Window, append, VerifyButton),

    new(RetryButton, button('Reiniciar', message(@prolog, reset_cell))),
    send(RetryButton, width, 100),
    send(RetryButton, height, 50),
    send(RetryButton, position, point(270, 600)),
    send(Window, append, RetryButton),

    new(CloseButton, button('Cerrar', message(Window, destroy))),
    send(CloseButton, width, 100),
    send(CloseButton, height, 50),
    send(CloseButton, position, point(390, 600)),
    send(Window, append, CloseButton).


% Crea el tablero del crucigrama
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
    send(Window, display, Label, point(PosX, PosY)).

% Crea una cellda en una posición dada y la almacena
create_cell(CrossWord, X, Y) :-
    new(Cell, text_item('')),
    send(Cell, length, 1),
    send(Cell, width, 3),
    send(CrossWord, append, Cell),
    send(CrossWord, display, Cell, point(X, Y)),
    assertz(cell(Cell)).  % Agrega la celda a la lista dinámica

reset_cell:-
    forall(cell(Cell),(
        send(Cell, selection, '')
    )).

% Predicado para verificar el contenido de cada celda
verificar :-
    forall(cell(Cell), (
        get(Cell, selection, Value),
        format('Valor de la celda: ~w~n', [Value])
    )).