%%
% Author:- Bhargav Patel
% Project:- Matlab algorithme for Singular Value Decomposition
%%
    n = 3;   %SIZE OF IMAGE.
    A = randi(n,n);
    
    %USE THIS WHEN INPUT IS RGB-IMAGE.
    %A = imread('fileName');
    %A = rgb2gray(A);
    [uu,ss,vv] = svd(double(A));
    AT = transpose(A);
    AC = double(A)*double(AT); 
    [eigenValue, eigenVector] = jacobi(AC);
    eigenValue = sqrt(eigenValue);
    for a=1:n-1
        min_idx = a;
        for b=(a+1):n
            if(eigenValue(b,b)>eigenValue(min_idx,min_idx))
                min_idx = b;
            end
        end
        temp = eigenValue(min_idx,min_idx);
        tempv = eigenVector(1:n,min_idx);
        eigenValue(min_idx,min_idx) = eigenValue(a,a);
        eigenVector(1:n,min_idx) = eigenVector(1:n,a);
        eigenValue(a,a) = temp;
        eigenVector(1:n,a) = tempv;
    end
   
    eigenValueT = eye(n,n);
    for k=1:n
        if(eigenValue(k,k)==0.0)
            eigenValueT(k,k) = 0.0;
        else
            eigenValueT(k,k) = 1/eigenValue(k,k);
        end
    end
    err = zeros(n,1);
    err_v = zeros(n,1);
    for a=1:n
        err(:,1) = (err(:,1)+(uu(1:n,a)+eigenVector(1:n,a)).^2)/n;
        err_v(a,1) = ss(a,a) - eigenValue(a,a);
    end
    disp(err);
    disp(err_v);
    eigenVectorT = transpose(eigenVector);
    
    % FOR IMAGE COMPRESSION
   % for z=10:n
   %     eigenValue(z,z) = 0.0;
   %     ss(z,z) = 0.0;
   % end
    format long;
    VT = matrixMultiply(matrixMultiply(eigenValueT,eigenVectorT),A);
    my = matrixMultiply(matrixMultiply(eigenVector,eigenValue),VT);
    inbuilt = matrixMultiply(matrixMultiply(uu,ss),vv');
    
    %FOR IMAGE VISULIZATION
    %figure(2);imshow(uint8(inbuilt));
    %figure(1);imshow(A);
    %figure(1);imshow(uint8(eigenVector));
    %figure(2);imshow(uint8(eigenValue));
    %figure(3);imshow(uint8(VT));
    %figure(3);imshow(uint8(my));
    
    disp(uu);
    disp(eigenVector);
    disp("********************");
    disp(ss);
    disp(eigenValue)
    disp("********************");
    disp(vv);
    disp(transpose(VT)); 
    