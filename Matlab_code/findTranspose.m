function [A] = findTranspose(A)

[row,col] = size(A);
for n1 = 1:row
    for n2 = 1:col
        if(n1<n2)
            temp = A(n1,n2);
            A(n1,n2) = A(n2,n1);
            A(n2,n1) = temp;
        end
    end
end

            