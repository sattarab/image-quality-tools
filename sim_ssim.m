function [SSIM_Value] = sim_ssim()
    % go to image directory not the best way but works %
    currDir = cd ('images');
    [imageName] = textread('imageNames.data', '%s');
    n = 100;
    SSIM_Value = zeros(n, 5);
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
            SSIM_Value(i, k) = ssim(origFileName, C{k});
        end
    end
    SSIM_Value = SSIM_Value(1:i, :);
    % go to src directory %
    cd ..;
end