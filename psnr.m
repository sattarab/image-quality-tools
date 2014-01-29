function [PSNR_Value] = psnr()
    [imageName] = textread('imageNames.data', '%s');
    n = 100;
    PSNR_Value = zeros(n, 5);
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
            I = origFileName;
            Ihat = C{k};

            % Read the dimensions of the image.
            [rows columns ~] = size(I);

            % Calculate mean square error of R, G, B.   
            mseRImage = (double(I(:,:,1)) - double(Ihat(:,:,1))) .^ 2;
            mseGImage = (double(I(:,:,2)) - double(Ihat(:,:,2))) .^ 2;
            mseBImage = (double(I(:,:,3)) - double(Ihat(:,:,3))) .^ 2;

            mseR = sum(sum(mseRImage)) / (rows * columns);
            mseG = sum(sum(mseGImage)) / (rows * columns);
            mseB = sum(sum(mseBImage)) / (rows * columns);

            % Average mean square error of R, G, B.
            mse = (mseR + mseG + mseB)/3;

            % Calculate PSNR (Peak Signal to noise ratio).
            PSNR_Value(i, k) = 10 * log10( 255^2 / mse);
        end
    end
    PSNR_Value = PSNR_Value(1:i, :);
end