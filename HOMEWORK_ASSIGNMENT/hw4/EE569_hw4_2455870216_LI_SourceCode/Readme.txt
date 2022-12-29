%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Attention: Read all the things below before running the code, thanks!

1. Run all the functions named hw4problemXXX to get the result as all them are final executive files

2. Adjust all the image read path to run the hw4problemXXX functions. In hw4problem1XX. The function dir.m is used to read all the image
    from the same filepath, just put all the traning set image and all the test set image in one file and use the file's rather than the image's path
    to fill the path of dir.m funcrtion.

3. In hw4problem3XXX, add the path of vl_feat tool box may be needed on your computer if you have not done so. And after you add the path, the
    kmeans function of matlab may have contracdiction to vl_kmeans function in the tool box. If you encounter this issue, you can just remove the 
    tool box path from matlab to run other function. And when you run hw4problem3XXX again, just add the path of the tool box back.

4. In hw4problem3c.m, adjust the path in rmpath('D:\MATLAB2020a\vlfeat-0.9.21\toolbox\noprefix') may be needed to run the code successfully.

5. By running the hw4problemXXX you can get all the result in command window and imshow figure. If you want to save the result, remove the
    notation on saveas(gcf,filepath) and adjust the path.

6. The result of hw4problem1 kmeans part is random in every run, match the label manually maybe needed to calculate the error rate.

7. In hw4problem2 the output label of each region ( gray scale) may not be the same in every run because of the random assignment of cluster
    center which is the nature of kmeans algorithm. That is not an error.