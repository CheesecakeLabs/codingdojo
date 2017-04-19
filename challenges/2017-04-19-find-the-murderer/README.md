# Find the Murderer

A manager was murdered and its body was left in front of the police station. A smart detective was chosen to solve the case. After a series of investigation, he organized a list with possible murderers, crime places and weapons.

```python
suspects = [
    'Charles B. Abbage',
    'Donald Duck Knuth',
    'Ada L. Ovelace',
    'Alan T. Uring',
    'Ivar J. Acobson',
    'Ras Mus Ler Dorf'
]
places = [
    'Redmond',
    'Palo Alto',
    'San Francisco',
    'Tokio',
    'Restaurante no Fim do Universo',
    'São Paulo',
    'Cupertino',
    'Helsinki',
    'Maida Vale',
    'Toronto',
]
weapons = [
    'Peixeira',
    'DynaTAC 8000X',
    'Trezoitão',
    'Trebuchet',
    'Maça',
    'Gládio',
]
```

A witness was found, but she can only answer if the detective presents a theory. For each theory, he guesses a murderer, a place and a weapon. The witness answers with just a number. If the theory is correct, she answers 0. If wrong, a value of 1, 2 or 3 is returned. 1 indicates that the murderer is wrong, 2 that the place is incorrect and 3 that the weapon is incorrect. If more than one assumption is wrong, she returns a random value between the ones that are incorrect.

For example, if the murderer is Donald Duck Knuth, using a Trezoitão em Tokio:

Theory: 1, 1, 1  
Returns: 1, or 2, or 3 (all incorrect) 

Theory: 3, 1, 3  
Returns: 1, or 3 (just the place is correct)

Theory: 5, 3, 4  
Returns: 1 (just the murderer is incorrect)

Theory: 2, 3, 4  
Returns: 0 (all correct, case solved)

Write a program that solve this problem. Initially, don't worry with the number of attempts to find the solution. After, try to improve the way that the theories are tested by the detective with the least number of attempts.

[Source](http://dojopuzzles.com/problemas/exibe/descubra-o-assassino/)

# Participants
* Alan
* Daniel
* Ceará
* Clarice
* Márcio
* Douglas
* Natan
* Bruninho
* Jojo

# Python Template

## Install
Tested with Python 3.  
Create a virtual environment and install the requirements with `pip install -r requirements.txt`

## Run
Run the tests with `nosetests --with-watch`
