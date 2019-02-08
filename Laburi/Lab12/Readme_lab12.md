# Lab0xC - ARM Assembly

- se implementeaza cateva programe de baza, pentru initierea in *ARM Assembly*

## 1-install-toolchain

- directorul contine scriptul `install_toolchain.sh` instaleaza utilitarele necesare compilarii *ARM Assembly*;

- binarele rezultate se vor rula folosind masina virtuala *qemu*;

- `hello-world.asm` este un program de test pentru a verifica functionarea toolchainului.

## 2-mul-sum

- se calculeaza si se afiseaza folosind `printf` suma patratelor primelor 10 numere naturale.

## 3-mem-addr

- programul afiseaza elementele unui vector de numere pana in 127 (`byte`) in ordine inversa.

## 4-flags

- se observa functionarea lui *break* (`b`) impreuna cu `ZF` (`beq`).

## 5-strings

- se calculeaza lungimea unui sir prin impelentarea functiei `strlen`;

- se cauta un subsir intr-un sir, prin functia `strstr`;

- aceasta functie, la randul sau, verifica pentru fiecare pozitia din sir, daca subsirul care incepe la aceasta incepe cu subsirul cautat, apeland `starts_with`.
