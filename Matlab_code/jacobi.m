function [D,eigenVectorMatrix] = jacobi(A)
    clc;
    %[per_D,per_v] = inbuilt_eigv(A);
    [row,col] = size(A);
    eigenVectorMatrix = eye(row,col);
    theta = findTheta(A);
    [largest,row_ind,col_ind] = findLargestElement(A);
    B = eye(row,col);
    B(row_ind, row_ind) = cos(theta);
    B(row_ind, col_ind) = -sin(theta);
    B(col_ind, row_ind) = sin(theta);
    B(col_ind, col_ind) = cos(theta);
    D = matrixMultiply(matrixMultiply(findTranspose(B),A),B);
    D = removeError(D);
    eigenVectorMatrix = eigenVectorMatrix*B;

    while(~isDiagonal(D))
        [row,col] = size(D);
        theta = findTheta(D);
        [largest,row_ind,col_ind] = findLargestElement(D);
    B = eye(row,col);
    B(row_ind, row_ind) = cos(theta);
    B(row_ind, col_ind) = -sin(theta);
    B(col_ind, row_ind) = sin(theta);
    B(col_ind, col_ind) = cos(theta);
         D = matrixMultiply(matrixMultiply(findTranspose(B),D),B);
         D = removeError(D);
        eigenVectorMatrix = eigenVectorMatrix*B;
    end
end


                
                
                        
            