'''
Real Python : Functional Programming in Python
- https://realpython.com/courses/functional-programming-python/

함수형 프로그래밍
- 프로그램상의 부작용, 버그를 줄이는 패러다임. 불변인 자료구조를 주로 사용. 
  복잡한 함수를 사용함으로서 얻는 부작용을 방지

변하는 자료구조: List, Dict
- 불변의 자료구조를 사용해라. 예를 들어서 병렬 프로그래밍을 할때 불변의 자료구조를 사용한다면
  이때 굳이 자료구조에 락을 설정할 필요가 없어진다
'''

'''
Section 1: immutable data structures
'''
# namedtuple
import collections
from pprint import pprint

Scientist = collections.namedtuple('Scientist', [
    'name', 
    'field',
    'born',
    'nobel',
])
ada = Scientist(name='Ada Lovelace', field='math', born=1815, nobel=False)
# ada.name = 'Ed love' 식으로 맘대로 변환시킬 수 없음
emmy = Scientist(name='Emmy Noether', field='math', born=1882, nobel=False)
marie = Scientist(name='Marie Curie', field='physics', born=1867, nobel=True)
tu = Scientist(name='Tu Youyou', field='chemistry', born=1930, nobel=True)
vera = Scientist(name='Vera Rubin', field='astronomy', born=1928, nobel=False)
sally = Scientist(name='Sally Ride', field='physics', born=1951, nobel=False)

# Tuple
scientists = (ada, emmy, marie, tu, vera, sally)

'''
Section 2: The filter() Function
'''
# filter generate generator
fs = filter(lambda x: x.nobel is True, scientists)
# next(fs)

# store data in a tuple
tuple(fs)

# list comprehension
tuple(x for x in scientists if x.nobel is True)

'''
Section 3: The Map() Function
- make an iterator that computes the function
  using arguments from each of the iterables.
'''
names_and_ages = tuple(map(
    lambda x: {'name': x.name, 'age': 2021 - x.born},
    scientists
))
pprint(names_and_ages)

# more pythonic
names_and_ages_list = [{'name': x.name, 'age': 2021 - x.born} for x in scientists]

'''
Section 4: The Reduce() Function
- reduce(function, sequence)
'''
from functools import reduce

total_age = reduce(
    lambda acc, val: acc + val['age'],
    names_and_ages,
    0
)
# print(total_age)

# group scientists by their fields
def reducer(acc, val):
    acc[val.field].append(val.name)
    return acc

scientist_by_field = reduce(
    reducer,
    scientists,
    {'math': [], 'physics':[], 'chemistry': [], 'astronomy': []}
)

scientist_by_field = reduce(
    reducer,
    scientists,
    collections.defaultdict(list)
)

# Grouping Data With itertools.groupby()
import itertools
scientist_by_field = {
    item[0]: list(item[1]),
    for item in itertools.groupby(scientists, lambda x: x.field)
}

scientist_by_field = reduce(
    lambda acc, val: {**acc, **{val.field: acc[var.field] + [val.name]}},
    scientists,
    {'math': [], 'physics':[], 'chemistry': [], 'astronomy': []}
) # it is not recommended - not pythonic

print(scientist_by_filed)