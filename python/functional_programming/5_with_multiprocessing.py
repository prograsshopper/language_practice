'''
Section 5: Parallel Processing With multiprocessing

'''
import collections
from pprint import pprint
import os

Scientist = collections.namedtuple('Scientist', [
    'name', 
    'field',
    'born',
    'nobel',
])

scientists = (
    Scientist(name='Ada Lovelace', field='math', born=1815, nobel=False),
    Scientist(name='Emmy Noether', field='math', born=1882, nobel=False),
    Scientist(name='Marie Curie', field='physics', born=1867, nobel=True),
    Scientist(name='Tu Youyou', field='chemistry', born=1930, nobel=True),
    Scientist(name='Vera Rubin', field='astronomy', born=1928, nobel=False),
    Scientist(name='Sally Ride', field='physics', born=1951, nobel=False),
)
pprint(scientists)

import time

def transform(x):
    print(f'Process {os.getpid()} working record {x.name}')
    time.sleep(1)
    result = {'name': x.name, 'age': 2021 - x.born}
    print(f'Process {os.getpid()} Done {x.name}')
    return result

# check completion time
# start = time.time()
# result = tuple(map(transform, scientists))
# end = time.time()
# print(f'time to completion: {end} - {start}')

import multiprocessing

start = time.time()
pool = multiprocessing.Pool(processes=len(scientists), maxtasksperchild=1)
result = pool.map(transform, scientists)
end = time.time()
print(f'time to completion: {end - start:.2f}s')
pprint(result)