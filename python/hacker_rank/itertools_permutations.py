from itertools import permutations
string, number = input().split(' ')
str_perms = sorted(list(permutations(string, int(number))))
for elem in str_perms:
    print(''.join(elem))