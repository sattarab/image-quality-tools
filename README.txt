Please add all the images in the "image" folder which is in the root/home directory and
follow the convention given below. 

To run these tests:
Go to the folder where sim_msssim.m, psnr.m and sim_ssim.m files are
(1) To run MSSIM test go do "[MSSSIM_VALUE] = sim_msssim" in Matlab. The value returned by the sim_msssim function is set 
to MSSSIM_VALUE 
(2) To run SSIM test do "[SSIM_VALUE] = sim_ssim" in Matlab. The value returned by the sim_ssim function is set 
to sSIM_VALUE 
(3) To run PSNR test do "[PSNR_VALUE] = psnr" in Matlab. The value returned by the psnr function is set 
to PSNR_VALUE
(4) To metrix_mux library (details of the library provided below) go to the metrix_mux folder do something like "[values] = sim_metrix_mux('SSIM')".
When simulating this you have to provide testName to run that test otherwise PSNR is the default test when run like "[values] = sim_metrix_mux"

For our usecase it would be following

1. [values] = sim_metrix_mux('SSIM');
2. [values] = sim_metrix_mux('PSNR');
3. [values] = sim_metrix_mux('MSSIM');

---------------------- Image Name Convention -----------------------
Important information regarding the image naming convention:
A file called "imageName.data" would contain an index of the all the images on you wish to run the quality tests on
so for each image its name would be of this form

"image1 - Orig.jpg"
"image1 - FbCopy.jpg"
"image1 - 2Copy.jpg"
"image1 - 3Copy.jpg"
"image1 - 4Copy.jpg"

"image2 - Orig.jpg"
"image2 - 1Copy.jpg"

The number or substring prefixed with substring "Copy" in image name should be added to threshold.data 

Notice: see how the number before the Copy substring in the name changes but there would be only one original image

<b>PSNR:</b>
A PSNR value of Inf means that the images are exactly equal

http://books.google.ca/books?id=ujnQogzx_2EC&pg=PA281&lpg=PA281&dq=acceptable+range+of+psnr+value&source=bl&ots=FoqtwG8xjP&sig=6_JkQEd2-BeGF4qHfy3RO0uBq4s&hl=en&sa=X&ei=H13oUu-2DaGCyQGfpoG4Dg&ved=0CCsQ6AEwAA#v=onepage&q&f=false

This book says that we cannot judge the quality of image using psnr value.


<b>SSIM:</b>

For running the ssim image quality test you have to do something like ssim(imread('Test1 - Orig.jpg'), imread('Test1 - 1Copy.jpg'))

Structural similarity between the two images will range from between -1 to  1.

where 1 being exactly identical images and as it decreases from 1 the difference between the two compared image increase


<b>MSSIM:</b>

For running the msssim image quality test you have to do the following

I = imread('Test1 - Orig.jpg');
I1 = rgb2gray(I);

J = imread('Test1 - 1Copy.jpg');
J1 = rb2gray(I);

msssim(I1, J1);

This function returns a value between -1 to 1 

where 1 being exactly identical images and as it decreases from 1 the difference between the two compared image increase

script code taken from http://sse.tongji.edu.cn/linzhang/IQA/Evalution_MS_SSIM/eva-MS-SSIM.htm


<b>metrix_mux library:</b>
To run this library in matlab you have to do the following steps
1. configure_metrix_mux
2. I = imread('Test1 - Orig.jpg');
3. J = imread('Test1- 1Copy.jpg');
4. metrix_mux(I, J, 'PSNR');

The algorithms by this external library are


algorithm	      			          indicator string

mean-squared-error	      		    'MSE'
peak signal-to-noise-ratio	      'PSNR'
structural similarity index	      'SSIM'
multi-scale SSIM index	      		'MSSIM'
visual signal-to-noise ratio	    'VSNR'
visual information fidelity	      'VIF'
pixel-based VIF	      			      'VIFP'
universal quality index	      		'UQI'
information fidelity criterion	  'IFC'
noise quality measure	      		  'NQM'
weighted signal-to-noise ratio	  'WSNR'
signal-to-noise ratio	      		  'SNR'

these indicator strings can be changed in the above metrix_mux statements

Library taken from
http://foulard.ece.cornell.edu/gaubatz/metrix_mux/



