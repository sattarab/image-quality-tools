function [PSNR_Value] = psnr(num_images)
    % if the num_images variable is not specified use the default value of
    % 1
    if ~exist('num_images','var')
        num_images = 1;
    end 
    currDir = cd ('images');
    [threshold] = textread('threshold.data', '%s');
    n = 100;
    PSNR_Value = zeros(n, 5);

    for i = 1:num_images
        src = strcat('image',int2str(i),'*Orig.jpg');
        origFile = dir(src);
        try
            origFileName = imread(origFile(1).name);
        catch exception
            error('the original image file doesnot exist');
        end
        for j =  1:length(threshold)
            copy = strcat('image',int2str(i),'*', threshold{j}, 'Copy.jpg');
            fileNames = dir(copy);
            filename = fileNames.name;
            I = origFileName;
            
            try
                Ihat = imread(filename);
            catch exception
                error('the copy of image file doesnot exist');
            end
            

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
            PSNR_Value(i, j) = 10 * log10( 255^2 / mse);

        end
    end
    
    PSNR_Value = PSNR_Value(1:i, :);
    % go to src directory %
    cd ..;
end