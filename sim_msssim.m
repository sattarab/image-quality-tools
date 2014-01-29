function [MSSSIM_Value] = sim_msssim()
    [imageName] = textread('imageNames.data', '%s');
    n = 100;
    MSSSIM_Value = zeros(n, 5);
    for i = 1:length(imageName)
        src = strcat('image',int2str(i),'*Orig.jpg');
        copy = strcat('image',int2str(i),'*Copy.jpg');
        fileNames = dir(copy);
        origFile = dir(src);
        origFileName = imread(origFile(1).name);
        C = cell(length(fileNames), 1);
        for k = 1:length(fileNames)
            filename = fileNames(k).name;
            C{k} = imread(filename);
        end
        
        for k = 1:length(fileNames)
            MSSSIM_Value(i, k) = msssim(rgb2gray(origFileName), rgb2gray(C{k}));
        end
    end
    MSSSIM_Value = MSSSIM_Value(1:i, :);
end