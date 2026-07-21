clear all
close all
clc

load datiTask1.mat
format longG

DRG_peso_soglia= [36, 0.8348, 10;...
                  78, 1.3409, 31;
                  484, 5.0987, 73;
                  104, 6.0620, 35;
                  287, 1.9678, 34;
                  235, 0.5858, 23;
                  134, 0.6701, 17;
                  410, 0.7539, 7;
                  511, 1.0977, 24;
                  317, 0.6553, 1;
                  68, 0.6264, 16;
                  462, 0.7570, 37;
                  371, 0.7334, 6;
                  37, 1.4700, 17;
                  79, 1.7612, 40;
                  105, 4.5572, 28;
                  236, 0.6652, 21];

DRG_peso_soglia = sortrows(DRG_peso_soglia,1);

%% Parte 1
pe = 3000; % Peso economico

DRG = ricoveri(:,4); % DRG di ogni ricovero
durata = ricoveri(:,5); % Durata di ogni ricovero

% Aggiungo i DRG di fianco per poter usare find() e trovare il DRG corrispondente
introiti_DRG = [DRG_peso_soglia(:,1), zeros(size(DRG_peso_soglia,1),1)]; % DRG - introiti 

for i  = 1:length(ricoveri)

    % Estraggo peso,soglia e durata standard del DRG corrente
    peso = DRG_peso_soglia(DRG_peso_soglia(:,1) == DRG(i), 2);
    soglia =  DRG_peso_soglia(DRG_peso_soglia(:,1) == DRG(i),3); 
    durata_standard = durateStd(durateStd(:,1) == DRG(i),2);

    % Cerco l'indice nella tabella introiti_DRG corrispondente al DRG corrente
    idx = find(introiti_DRG(:,1) == DRG(i));

    % Calcolo le tariffe
    T2 = peso*pe;
    daily_cost = T2/durata_standard; %T2 = daily_cost * durata_standard
    T1 = daily_cost*0.8;
    T3 = daily_cost*0.6;

    % Verifico quale tariffa applicare
    if durata(i) == 1
        introiti_DRG(idx, 2) = introiti_DRG(idx,2) + T1;
    elseif durata(i) > 1 && durata(i) <= soglia
        introiti_DRG(idx, 2) = introiti_DRG(idx, 2) + T2;
    else
        introiti_DRG(idx, 2) = introiti_DRG(idx,2) + T3*(durata(i)-soglia) + T2;
    end
end


% Introito totale percepito dall'azienda ospedaliera
introito = sum(introiti_DRG(:,2));


%% Parte 2 (potrei fare tutto nello stesso for ma divido per mantenere l'ordine)

% Aggiungo i DRG di fianco per poter usare find() e trovare il DRG corrispondente
casi_inf = [DRG_peso_soglia(:,1) , zeros(size(DRG_peso_soglia,1),1)]; 
casi_trasf = [DRG_peso_soglia(:,1) , zeros(size(DRG_peso_soglia,1),1)];
casi_tot  = [DRG_peso_soglia(:,1) , zeros(size(DRG_peso_soglia,1),1)];

for i = 1:length(ricoveri)
    durata_standard = durateStd(durateStd(:,1) == DRG(i),2);
    idx = find(casi_trasf(:,1) == DRG(i)); %NB: idx è uguale per le 3 matrici!

    % Paziente trasferito
    if ricoveri(i,7) == 1 
        casi_trasf(idx, 2) = casi_trasf(idx, 2) + 1; 
    end

    % Durata inferiore a quella standard
    if durata(i) < durata_standard/3 
        casi_inf(idx, 2) = casi_inf(idx, 2) + 1;
    end
    
     %Aggiorno i casi totali
    casi_tot(idx, 2) = casi_tot(idx, 2) + 1;
end

% Calcolo le proporzioni (aggiungo i DRG a fianco per una migliore lettura)
prop_inf = [DRG_peso_soglia(:,1), casi_inf(:,2)./casi_tot(:,2)];
prop_trasf = [DRG_peso_soglia(:,1), casi_trasf(:,2)./casi_tot(:,2)];
