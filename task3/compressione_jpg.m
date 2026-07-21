%% TASK 3

clear
close
clc

load('matriceQ.mat')

img = imread('13_ECO_Mammaria.jpg');

% Identifico il numero di righe N e colonne M per dividere in blocchi di 8 bit
[n,m] = size(img);

N = ceil(n/8);
M = ceil(m/8);

% Faccio padding di zeri se le dimensioni non sono multipli di 8
img_padding = zeros(N*8, M*8);
img_padding(1:n, 1:m) = img;

% Fattore di compressione aplha
alpha = 10;
Q_alpha = Q * alpha;

% Scorro ogni blocco 8x8 e ne estraggo componente DC e AC
dc = [];
ac_blocchi = [];
for r = 1:N
    for c = 1:M
        % Estraggo il blocco 8x8 corrente
        ir_min = (r-1) * 8 + 1;
        ir_max = r * 8;

        ic_min = (c-1) * 8 + 1;
        ic_max = c * 8;

        B = img(ir_min:ir_max, ic_min:ic_max);

        % Faccio la trasformata dct2
        B_dct = dct2(B);

        % Quantizzo con fattore alpha i coefficienti
        B_dct_quant = round(B_dct./Q_alpha);
        
        % Calcolo il vettore zigzag
        zz = zigzag(B_dct_quant);

        % Aggiungo la componente DC
        dc = [dc, zz(1)];

        % Aggiungo la componente AC
        ac_blocchi = [ac_blocchi; zz(2:end)];
    end
end

% Codifica della componente DC in modo differenziale
for i = length(dc):-1:2
    dc(i) = dc(i) - dc(i-1);
end

% Creazione e scrittura del file 
file = fopen('ISONI_GRUPPO13_TASK3_QUESITO1.txt', 'w');
for i = 1:size(ac_blocchi,1)

    % Codifica della componente AC (tolgo gli zeri in coda)
    current_row = ac_blocchi(i,:);
    last_non_zero = find(current_row, 1, 'last');
    if isempty(last_non_zero)
        current_row = [];
    else
        current_row = current_row(1:last_non_zero);
    end

    % Compilo il file
    str = ['<' num2str(dc(i)) '>' '<' num2str(current_row) '>'];
    fprintf(file,'%s\n',str);
end
fclose(file);
