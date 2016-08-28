#!/bin/bash

find . -name \*.dll -exec rm {} \; 
find . -name \*.pdb -exec rm {} \; 
find . -name \*.xml -exec rm {} \; 
find . -name \*.cache -exec rm {} \; 

