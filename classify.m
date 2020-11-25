function y = classify(x, classification_data)
%Gets how many classes exists
nc=length(classification_data)-2;
%Priori probabilities
pn = classification_data{nc+1};
%All classes
yu = classification_data{nc+2};
%Computes probabilities for each class on the feature vector x
probs=zeros(1,nc);
for i=1:length(x)
    for class=1:nc
        probs(class) = probs(class) + log(normpdf(x(i) ,classification_data{class}(i,1) ,classification_data{class}(i,2)));
    end
end
%Computes each posteriori probability
for class=1:nc
    probs(class)=probs(class)+log(pn(class));
end
%Computes MAP estimation for the feature vector x
[~,id]=max(probs,[],2);
%Returns the y-value with the highest probability
y=yu(id);
