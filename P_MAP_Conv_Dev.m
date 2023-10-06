%% this work belongs to the following paper:
% Al-Ameen, Zohair, and Zainab Younis. 
% "Improved Poisson MAP Algorithm for Better Image Deconvolution." 
% 2022 IEEE International Conference on Cybernetics and Computational Intelligence (CyberneticsCom). IEEE, 2022.
% DOI: 10.1109/CyberneticsCom55287.2022.9865641
function result = P_MAP_Conv_Dev(image, PSF, iteration)
fn = image; % at the first iteration
c1=[0 .5 0; .5 -2 .5; 0 .5 0]; 
c2=[0 .25 0; .25 -1 .25; 0 .25 0];
LS1 = imfilter(image,c1,'replicate','conv');
for i=1:iteration
    Hfn =imfilter(fn, PSF,'conv');
    LS2 = imfilter(Hfn,c2,'replicate','conv');
    ratio = (( (image-LS1)./(Hfn+LS2) )-1); 
    res = imfilter(ratio, PSF,'conv');
    fn = ( fn .* exp(res) ); 
end
result = fn; 