clear all
close all
clc

txt = readlines("DRG.txt");
line = char(txt(13,1));

N = 55;
e = 13;
k = 5; % massimo valore tale per cui 2^k<N, lunghezza di ogni blocco

%Converto ogni carattere in binario a 16 bit
ascii = double(line);
ascii_bin = dec2bin(ascii,16);

%Rendo una stringa per poi dividere in blocchi
s = [];
for i = 1:size(ascii_bin,1)
    s = [s, ascii_bin(i,:)];
end

%Nel caso serva applico lo zero padding
while mod(length(s),k) ~= 0
    s = [s, '0'];
end

%Divido in blocchi lunghi k e converto in decimale
M_block = zeros(length(s)/k,k);
j = 1;
for i = 1:k:length(s)
    M_block(j,:) = s(i:i+k-1);
    j = j+1;
end
M_block = char(M_block);
M = bin2dec(M_block);

%Eseguo la Cifratura e converto in binario a 6 bit (il massimo resto è 54 < 2^6)
M_cript = mod(M.^e,N);
nbit = 6; %il massimo resto possibile è 54 < 2^6, la codifica richiede almeno 6 bit
M_cript = dec2bin(M_cript,nbit);

%Rendo una stringa per dividere in blocchi
s_cript = [];
for i = 1:length(M_cript)
    s_cript = [s_cript, M_cript(i,:)];
end

%Nel caso serva applico lo zero padding
while mod(length(s_cript),16) ~= 0
    s_cript = [s, '0'];
end

%Divido in blocchi lunghi 16 e converto in decimale
M_cript_block = zeros(length(s_cript)/16,16);
j = 1;
for i = 1:16:length(s_cript)
    M_cript_block(j,:) = s_cript(i:i+16-1);
    j = j+1;
end
M_cript_block = char(M_cript_block);

%Out
ascii_numbers = bin2dec(M_cript_block);
txt = char(ascii_numbers');
disp(txt)

file = fopen('ISONI_GRUPPO13_TASK2_QUESITO1.txt', 'w');  
fprintf(file,'%s\n', txt); 
fprintf(file, '%s\n', s_cript); 
fclose(file);  
