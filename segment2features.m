function features = segment2features_improved(I)
    [row , col] = find(I == 1);
    %Creates an image that is as big as it has to be
    Image1 = I(min(row):max(row), min(col):max(col));
    Im = logical(imresize(Image1, [17 17]));
    [~, collen] = size(Im);
    cent = regionprops(Im,'all');
    %Number of holes
    features(1)=numel(find(~Im));
    %Centroid of columns
    features(2)=cent.Centroid(1)/collen;
    middle=round((max(row)-min(row))/2 +min(row));
    upper=I(middle:max(row), min(col):max(col));
    [hu, wu] = size(upper);
    %Upper half
    statsupper = regionprops(upper, 'Centroid');
    features(3)=statsupper.Centroid(1)/wu;
    features(4)=statsupper.Centroid(2)/hu;
    %Lower half
    lower=I(min(row):middle, min(col):max(col));
    [hl, wl] = size(lower);
    statslower = regionprops(lower, 'Centroid');
    features(5)=statslower.Centroid(1)/wl;
    features(6)=statslower.Centroid(2)/hl;
    %Left half
    middleCols=round((max(col)-min(col))/2 +min(col));
    left=I(min(row):max(row), min(col):middleCols);
    [hleft, wleft] = size(left);
    statsleft = regionprops(left, 'Centroid');
    features(7)=statsleft.Centroid(1)/wleft;
    features(8)=statsleft.Centroid(2)/hleft;
    %Right half
    right=I(min(row):max(row), middleCols:max(col));
    [hright, wright] = size(right);
    statsright = regionprops(right, 'Centroid');
    features(9)=statsright.Centroid(1)/wright;
    features(10)=statsright.Centroid(2)/hright;
end