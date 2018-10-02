function [multiplied_matrix,status] = matrixMultiply(A,B)

[row_A,col_A] = size(A);
[row_B,col_B] = size(B);

multiplied_matrix = zeros(row_A,col_B);
status = false;

if(col_A == row_B)
    status = true;
    for n1 = 1:row_A
        %disp(n1);
        for n2 = 1:col_A
             sum = 0;
             for k = 1:col_B
                sum = sum + double(A(n1,k))*double(B(k,n2));
             end
             multiplied_matrix(n1,n2) = sum;
        end
    end
end
