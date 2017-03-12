#!/usr/bin/env python
# -*- coding:utf-8 -*-

#   Copyright 2016 Takashi Ando - http://blog.rinka-blossom.com/
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

import os
from setuptools import setup, find_packages


def readme():
    try:
        _r = os.path.join(os.path.dirname(__file__), 'README.rst')
        with open(_r, 'r') as _f:
            return _f.read()
    except:
        return ''


def requires():
    try:
        with open('requirements.txt', 'r') as _f:
            return _f.readlines()
    except:
        return []


setup(
    name='solar_monitor',
    version='2.1.2',
    description='Solar charge controller monitor like TS-MPPT-60',
    long_description=readme(),
    license="Apache Software License",
    author='Takashi Ando',
    url='https://github.com/dodo5522/solar_monitor.git',
    install_requires=requires(),
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'solar_monitor = solar_monitor.__main__:main'
        ]
    },
    test_suite='nose.collector',
    classifiers=[
        'Development Status :: 4 - Beta',
        'Environment :: Console',
        'License :: OSI Approved :: Apache Software License',
        'Natural Language :: Japanese',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
        'Topic :: System :: Monitoring',
    ]
)
