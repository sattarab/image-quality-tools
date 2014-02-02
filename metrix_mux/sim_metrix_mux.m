function [value] = sim_metrix_mux(testName)
   
    if ~exist('testName','var')
        testName='PSNR';
    end
    
    configure_metrix_mux;
    cd ..;
    cd ('images');
    [imageName] = textread('imageNames.data', '%s');
    n = 100;
    value = zeros(n, 5);
    
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
            value(i, k) = metrix_mux(origFileName, C{k}, testName);
        end
    end
    
    value = value(1:i, :);
    cd ..;
    cd ('metrix_mux');
end