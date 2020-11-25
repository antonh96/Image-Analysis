function classification_data = class_train(X, Y)
yu=unique(Y); % Gets all classes that exists
nc=length(yu); % Number of classes
classification_data = cell(1 ,nc+2); %Creates output array
%Array to extract the classes in separate arrays
X_class = cell(1,nc);
%Array to hold how much data that exist in each class
class_length = cell(1,nc);
%Array to hold mu and sigma for each class
class_data = cell(1,nc);
for i=1:nc
    X_class{i} = X(: ,Y==yu(i));
    class_length{i} = size(X_class{i},1);
    class_data{i}=zeros(class_length{i},2);
end
%Computes mu and sigma for each class
for class=1:nc
    for i=1:class_length{class}
        class_data{class}(i,1)=mean(X_class{class}(i,:));
        class_data{class}(i,2)=std(X_class{class}(i,:));
    end
end
ptotal = size(X,2);
probs = cell(1,nc);
%Computes the prori probabilities for each class
for i=1:nc
    probs{i}=size(X_class{i},2)/ptotal;
end

for class=1:nc
    %Puts mu and sigma for each class in the output array
    classification_data{class}=class_data{class};
    %Puts the priori probabilities for each clas in the output array
    classification_data{nc+1}(class)=probs{class};
end
%Puts the classes in the output array
classification_data{nc+2}=yu;

