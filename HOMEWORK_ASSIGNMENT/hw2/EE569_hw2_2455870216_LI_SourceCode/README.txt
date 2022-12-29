%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
Attention: Read all the things below before running the code, thanks!
1. Add the path of toolbox and edge master first so that we can use the .m functions in the two fold.

2. All the raw image filepath has been replaced by its name namely the relative filepath. Full file path may be needed to run the code successfully,

3. Run all the m function hw2problem### to get the result, these are main executive functions. And this should be run in sequence because hw2problem1d###s 
need to use the result of hw2problem1a###s and hw2problem1c as its input. 
Details:
   1): ski_sobel_edge.tif  is generated in hw2problem1a_ski and it is one of the input in hw2problem1d_sobel

   2): ele_sobel_edge.tif is generated in hw2problem1a_ele and it is one of the input in hw2problem1d_sobel

   3): ski_person_se_edge.tif is generated in edgesDemo called by hw2problem1c,m and it is one of the input in hw2problem1d_structural_edge

   4): elephant_se_edge.tif is generated in edgesDemo called by hw2problem1c,m and it is one of the input in hw2problem1d_structural_edge

   If you need to adjust the filepath of this picture, please find the code position by the information above.

4. I have hw2writeraw and saveas to save result pictures in my report but for convenience I also have imshow in my code for you to review the result
so I have notation on all hw2writeraw and saveas sentence in my code. If you want to save the file ,you can just remove the notation on it and adjust the
corresponding filepath to save image to your computer.

5. I made some modification in edgeDemo  and EdgesEvalImg to meet my purpose. And all the code in edges-master and getNearestVertex are open-source code.

6. hw2problem###ele or  hw2problem###ski means the result of two different pictures, I write them separately to avoid making it messed up.
############################################
Explanation of some of the functions:

#threshBinarize.m use arrangement to implement the thresholds, like higher that 95% of the pixels.

#canny-proba_map.m is used to get the probability map of canny method output, it is called in hw2problem1d_canny.m

#calPRFmean is used to get the mean of all P,F,R under different thresholds.

#CalPRGdiffThresh is used to calculate P,F,R vector which including series of P,R,F values under different thresholds to plot the threshold vs P,R,F value plot.

#CMYRGBconvert can do both CMY  to RGB and RGB to CMY

#gradientNorm is used to normalize oringinal gradient map

For other function, you can know what they are used for just by its name because I used very complete function name to make it very easy to understand.