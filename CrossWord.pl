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
<<<<<<< HEAD
   create_crossWord(CrossWord),
    
    % %Esto es pa los inputs
    % send(Window, append, new(HInputs, dialog_group(inputsH))),
    % add_inputH(HInputs, 1, 50),
    % send(Window, append, new(VInputs, dialog_group(inputsV)), right),
    % add_inputV(VInputs, 6, 50),

=======
    create_crossWord(CrossWord),

    set_buttons(Window),
    set_horizontal_container(Window),
    set_vertical_container(Window),
>>>>>>> 64f05a05a2abe5faf910386b541fe94643227a05



%     % Crear y almacenar inputs en la lista 'Inputs'
%     create_crossWord(CrossWord, Inputs),

    % % Botón para obtener los valores de todos los inputs
    % new(GetButton, button('Obtener Valores de Todos los Inputs',
    %     message(@prolog, obtener_valores, Inputs))),  % Llamada al predicado con la lista de inputs
    % send(Window, append, GetButton),










    %Esta pija abre la ventana
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
        % 1
    add_label(CrossWord, '1', 190, 55),
    create_cell(CrossWord, 200, 50, cell_1),
    create_cell(CrossWord, 240, 50, cell_2),
    create_cell(CrossWord, 280, 50, cell_3),
    create_cell(CrossWord, 320, 50, cell_4),
    create_cell(CrossWord, 360, 50, cell_5),
    create_cell(CrossWord, 400, 50, cell_6),
    create_cell(CrossWord, 440, 50, cell_7).

% Predicado para agregar un label en una posición dada
add_label(Window, Text, PosX, PosY) :-
    new(Label, label(nombre_label, Text)),
    send(Window, append, Label),
    send(Window, display, Label, point(PosX, PosY)).

<<<<<<< HEAD



create_cell(CrossWord, X, Y, Id) :-
    new(Cell, frame),        % Crear una celda como un frame vacío
    send(Cell, name, Id),    % Asignar un identificador único sin mostrarlo
    send(Cell, length, 1),
    send(Cell, width, 3),
    send(CrossWord, append, Cell),
    send(CrossWord, display, Cell, point(X, Y)).  % Mostrar la celda sin texto


=======
% Crea una cellda en una posición dada y la almacena
create_cell(CrossWord, X, Y) :-
    new(Cell, text_item('')),
    send(Cell, length, 1),
    send(Cell, width, 3),
    send(CrossWord, append, Cell),
    send(CrossWord, display, Cell, point(X, Y)),
    assertz(cell(Cell)).  % Agrega la celda a la lista dinámica
>>>>>>> 64f05a05a2abe5faf910386b541fe94643227a05

reset_cell:-
    forall(cell(Cell),(
        send(Cell, selection, '')
    )).

<<<<<<< HEAD
% Predicado para obtener el valor de una celda específica
get_cell_value(Id, Value) :-
    get(@prolog_window?member(Id), selection, Value).
=======
% Predicado para verificar el contenido de cada celda
verificar :-
    forall(cell(Cell), (
        get(Cell, selection, Value),
        format('Valor de la celda: ~w~n', [Value])
    )).
>>>>>>> 64f05a05a2abe5faf910386b541fe94643227a05
