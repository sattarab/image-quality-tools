PSNR:
A PSNR value of Inf means that the images are exactly equal

http://books.google.ca/books?id=ujnQogzx_2EC&pg=PA281&lpg=PA281&dq=acceptable+range+of+psnr+value&source=bl&ots=FoqtwG8xjP&sig=6_JkQEd2-BeGF4qHfy3RO0uBq4s&hl=en&sa=X&ei=H13oUu-2DaGCyQGfpoG4Dg&ved=0CCsQ6AEwAA#v=onepage&q&f=false

This book says that we cannot judge the quality of image using psnr value.


SSIM:

For running the ssim image quality test you have to do something like ssim(imread('Test1 - Orig.jpg'), imread('Test1 - 1Copy.jpg'))

Structural similarity between the two images will range from between -1 to  1.

where 1 being exactly identical images and as it decreases from 1 the difference between the two compared image increase
