# Lab0xB - optimizari

- optimizari de dimensiune si timp de executie atat in *C*, cat si la nivel de *Assembly*

## 1-2-loop-unrolling

- facand *loop unrolling* se elimina cate `3 * N` operatii de tipul `cmp`, `jmp` si `add`, ceea ce duce la o reducere a timpului de executie;

- timpii de executie variaza intrucat acestia depind de felul in care procesorul executa instructiunile (inclusiv pe cele din sistem) si de fluxul de date;

- `normal_loop_op` nu mai efectueaza `for`ul deoarece compilatorul a decis ca, din moment ce `sum` nu este folosit nicaieri, acesta este redundant;

- in momentul in care sum este afisat, acesta devine important, iar compilatorul nu mai elimina `for`ul, ci doar il optimizeaza;

- optimizarea compilatorului se bazeaza pe folosirea exclusiva a registrelor pentru parcurgerea `for`ului: `eax` este adresa din vector, `edx` este adresa de sfarsit din vector, iar `esi` este suma;

- cand `N` este mic (10), compilatorul face singur *loop unrolling* pentru a scadea timpul de rulare;

- diferenta de performanta nu este mare, iar acum timpii sunt mai mari decat cei obtinuti cu *normal_loop_op*, deoarece acum este nevoie de aceleasi accese la memorie de care era nevoie si inainte de optimizarea cu `-O3`, deci nu se mai pot folosi exclusiv registrele pentru calculul sumei.

## 3-optimize

- avand in vedere ca N este cunoscut, toate sumele pot fi calculate matematic, in `O(1)`.

## 4-string-instructions

- se observa ca `loop`urile hardware (`scasb`) sunt mai lente in executie decat cele software (`inc`, `cmp`, `jmp`);

- inputul de test se afla in `file.txt`.

## 5-profiling

- este ilustrata folosirea mnemonicii de profiling `rdtsc`.

## 6-optimize-assembly

- codul din `optimize.asm` calculeaza suma primelor `N` elemente dintr-un vector;

- in cadrul optimizarii se parcurge vectorul de la final la inceput, iar suma se calculeaza folosind mnemonica `lea`;

- de asemenea, pentru a nu face o comparare inutila, *jumpul* se executa doar daca instructiunea `dec` nu a setat `ZF`;

- intrucat nu este nevoie de variabile locale in aceasta functie, nu are sens nici crearea unui *stack frame*, ceea ce reduce dimensiunea programului.
