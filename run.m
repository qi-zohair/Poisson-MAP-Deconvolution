%% This work belongs to the following paper:
% Al-Ameen, Zohair, and Zainab Younis. 
% "Improved Poisson MAP Algorithm for Better Image Deconvolution." 
% 2022 IEEE International Conference on Cybernetics and Computational Intelligence (CyberneticsCom). IEEE, 2022.
% DOI: 10.1109/CyberneticsCom55287.2022.9865641
% Email: qizohair@uomosul.edu.iq
clear all; close all; clc;
%% read the image
x=im2double(imread('1.jpg'));
figure; imshow(x);title('Blurry Image')
%% create the PSF
PSF = fspecial('gaussian',[19 19], 1);
%% Poisson MAP Algorithm Original
tic; OPMAP = P_MAP_Conv(x, PSF, 25); toc;
figure; imshow(OPMAP);title('Poisson MAP Algorithm Original')
% imwrite(OPMAP,'OPMAP_P4.jpg')
%% Poisson MAP Algorithm Developed
tic; IPMAP = P_MAP_Conv_Dev(x, PSF, 8); toc;
figure; imshow(IPMAP);title('Poisson MAP Algorithm Dev')
% imwrite(IPMAP,'IPMAP_P4.jpg')