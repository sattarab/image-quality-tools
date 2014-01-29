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



