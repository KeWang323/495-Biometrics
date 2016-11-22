%%%%%%runPCAtraining.m%%%%%%
clear;
clc;
display('*****************************************')
display('*****************************************')
display('*****************************************')
display('Train: Strat training front face')
display('Train: Please wait...')
[ MeanFace_front,eigenVector_front,coefficient_front ] = train_front();
display('Train: Front face training complete')
display('*****************************************')
display('*****************************************')
display('*****************************************')
display('-----------------------------------------')
display('*****************************************')
display('*****************************************')
display('*****************************************')
display('Train: Strat training side face')
display('Train: Please wait...')
[ MeanFace_side,eigenVector_side,coefficient_side ] = train_side();
display('Train: Side face training complete')
display('*****************************************')
display('*****************************************')
display('*****************************************')