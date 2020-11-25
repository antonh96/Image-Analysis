function [S] = im2segment_improved(im)
    m = size(im,1);
    n = size(im,2);
    %Converts the image to a binary image with only 0 and 1
    binaryImage = imbinarize(im, 37);
    %Filters out only the 5 biggest objects in the image
    BW = bwpropfilt(binaryImage,'perimeter',5);
    %Finds all connected components in the image
    CC = bwconncomp(BW,8);
    for kk = 1:5
        %Sets zeros on all positions in the whole image
        S{kk} = zeros(m,n);
        %Sets ones on the positions which is the current number
        S{kk}(CC.PixelIdxList{kk}) = 1;
    end