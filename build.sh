#!/bin/bash
cobc -xjF -fcomplex-odo -fodo-without-to=ok -fodoslide -ftop-level-occurs-clause=ok main.cbl
