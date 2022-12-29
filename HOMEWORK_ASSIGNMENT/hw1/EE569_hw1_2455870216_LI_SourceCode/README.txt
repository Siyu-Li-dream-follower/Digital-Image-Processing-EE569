%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu

Steps and Attentions:

1. Open all problem##.m such as problem21.m files first to change the root of the raw file in order to read raw file successfully and write them into
proper position. (In function ModifiedReadraw and universalwriteraw.

2. Open problem#main.m to run all the code in each problem. For example run problem3main.m will resulte in running problem31.m problem32.m and 
problem33.m.

3. In this homework I wrote all the functions myself so there will not be any open source code in problem2 NL Means related parts.

4. Due to the high computational complexity of NL Means method, I deliberately set the loop for searching parameter so only optimal value parameter
set is traversed here to save the time of grader's. If you want to run more to compare with the result in my report you can add value to the array 
of the loop in problem23.m and problem24.m. Other parameters for NL Means filter I have used are just behind the loop in the notation part. 
You can just add it and run the code again.

5. Read instructions in notation in problem#main before running the code.

###########################################################################################################
Explaination of m functions in my source code:

absolutevalue.m
#The input is an image. The function take absolute value pixel by pixel.

bilateralfilter.m
#This function is used to perform bilateral filtering with different parameter of filter core radius r, two standard deviation value sigmac and sigmas.

bilinearDemo.m
# This function can handle input with different color needed to be recovered when performing bilinear demosacing. The input parameter color =1,2,3 which means we are recovering
red, green and blue pixels respectively.

CalHist.m
# This function is to calculated the intensity value histogram of an image(You can also regard it as getting pmf)

coreNormalization
# This function is to normalize the weights when create a certain core of a filter.

cumulativeHistogram.m
# This function is to calculate cumulative histogram of pixel intensity in an image with intensity histogram as input, (Can be regarded as CDF)

filterGaussian.m
# Basic filter method with Gaussian distribution weighted function, we can adjust filter parameter filter core radius r and standard deviation sigma.

filterUnifWeight.m
#Basic filter method with Uniform distribution weighted function, we can adjust  filter parameter filter core radius r.

findCoreMode.m
#To find the intensity with the highest frequency in filter core to replace center pixel value to perform oil painting effect.

intensityTransfer.m
#Use the original image and transfer function as input to tranfer old intensity to the new one pixel by pixel.

matrixsubtract.m
# Do subtraction operation beween to matrices

MatrixTranspose.m
# Do matrix transpose

MHCDemo.m
# Do MHC demosaising. It can recover three color in only one function.

ModifiedReadraw.m
#Can read raw image and tranform it into image ready to be shown. It can also accept both gray image and color image with 3 channels.

NLmeansfilter.m
# To perform NL Means filtering with 4 parameters adjustable. rlarge radius of large window, rsmall radius of small window, h smoothing factor
when calculating weights , sigma the same

noiseaverage.m
# Calculate noise average in an image

noiseHistogram.m
# This function has three output noise histogram and minimum and maximum value to determine the range of bar plot x axis later

noisevariance.m
#  Calculate noise variance in an image

oliPaintingFilter.m
# To make image look blurry to create oil painting effect using color reduced image as input, With input r increases, the output image will become
more and more blurry.

outlierRemove.m
# To get rid of impluse noise in problem24, it uses a threshold to decide whether a center pixel is an outlier.

PSNRCalculate.m
# Calculate peak signal to noise ratio in DB of an image. It need both noisy image and clean original image as input.

rearrange.m
# In equalization method B in problem14, which arrange all the pixel in ascending order based on intensity and regroup them with equal quantity
 group after randomzie pixels in the same original group.

universalColorsetReduction.m
# Do many level of intensity level reduction just by adjust input level value r.

universalColorsetReduction.m
# Pad image with any width increment on all four corners by adjusting input parameter n.

universalwriteraw.m
# Can transform both color and gray image into raw image. Input filename is where you want to write the raw document to.


















