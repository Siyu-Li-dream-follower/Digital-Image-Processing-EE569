%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23rd 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function transposed = HW2MatrixTranspose(matrix)

[m,n] = size(matrix);
transposed = zeros(n,m);
  for i=1:m
      for j=1:n
        transposed(j,i) = matrix(i,j);
      end
  end

end