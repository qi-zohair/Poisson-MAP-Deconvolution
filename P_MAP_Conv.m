%% this work belongs to the following paper:
% Al-Ameen, Zohair, and Zainab Younis. 
% "Improved Poisson MAP Algorithm for Better Image Deconvolution." 
% 2022 IEEE International Conference on Cybernetics and Computational Intelligence (CyberneticsCom). IEEE, 2022.
% DOI: 10.1109/CyberneticsCom55287.2022.9865641

function result = P_MAP_Conv(image, PSF, iteration)
fn = image; % at the first iteration
for i=1:iteration
    Hfn =imfilter(fn, (PSF),'conv');
    ratio = (image./Hfn)-1; 
    res = imfilter(ratio, PSF,'conv');
    fn = fn.*exp(res); 
end
result = fn; 