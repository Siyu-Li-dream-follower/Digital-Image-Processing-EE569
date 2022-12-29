%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function existanceMap = stage2Filter_K(stage1result)
[m,n] = size(stage1result);
existanceMap = zeros(m,n);
stage1resultPad = hw3zeroPadding(stage1result, 1);
for i=1:m
    for j=1:n
        if stage1resultPad(i + 1,j + 1) == 1
            
            % spur
            spur1 = ~stage1resultPad(i,j) && ~stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                ~stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j ) && ~stage1resultPad(i + 2,j + 1) && stage1resultPad(i + 2,j + 2);
            spur2 = ~stage1resultPad(i ,j ) && ~stage1resultPad(i ,j + 1) && ~stage1resultPad(i ,j + 2) && ...
                ~stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            spur3 = ~stage1resultPad(i,j) && ~stage1resultPad(i,j + 1) && stage1resultPad(i ,j + 2) && ...
                ~stage1resultPad(i + 1, j ) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            spur4 = stage1resultPad(i ,j) && ~stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                ~stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            % Single 4-connection
            Single4C1 = ~stage1resultPad(i ,j ) && ~stage1resultPad(i ,j + 1) && ~stage1resultPad(i,j + 2) && ...
                ~stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            Single4C2 = ~stage1resultPad(i ,j) && ~stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                ~stage1resultPad(i + 1, j) && stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            Single4C3 = ~stage1resultPad(i,j) && ~stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            Single4C4 = ~stage1resultPad(i,j) && stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                ~stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            % L Corner
            LCorner1 = ~stage1resultPad(i,j) && stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                ~stage1resultPad(i + 1, j) && stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            LCorner2 = ~stage1resultPad(i,j) && stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            LCorner3 = ~stage1resultPad(i,j) && ~stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                ~stage1resultPad(i + 1, j) && stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            LCorner4 = ~stage1resultPad(i,j) && ~stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            % Corner Cluster
            CornerCluster1 = stage1resultPad(i ,j) && stage1resultPad(i,j + 1) && ...
                stage1resultPad(i + 1,j);
            CornerCluster2 = stage1resultPad(i + 1,j + 2) && ...
                stage1resultPad(i + 2,j + 1) && stage1resultPad(i + 2,j + 2);
            % Tee Branch
            TeeBranch1 = stage1resultPad(i,j + 1) && ...
                stage1resultPad(i + 1, j) && stage1resultPad(i + 1,j + 2);
            TeeBranch2 = stage1resultPad(i,j + 1) && ...
                stage1resultPad(i + 1, j) && ...
                stage1resultPad(i + 2,j + 1);
            TeeBranch3 = stage1resultPad(i + 1, j) && stage1resultPad(i + 1,j + 2) && ...
                stage1resultPad(i + 2,j + 1);
            TeeBranch4 = stage1resultPad(i ,j + 1) && ...
                stage1resultPad(i + 1, j + 2) && ...
                stage1resultPad(i + 2,j + 1);
            % Vee Branch
            VeeBranch1 = stage1resultPad(i ,j) && stage1resultPad(i,j + 2) && ...
                (stage1resultPad(i + 2,j) || stage1resultPad(i + 2,j + 1) || stage1resultPad(i + 2,j + 2));
            VeeBranch2 = stage1resultPad(i ,j) && ...
                stage1resultPad(i + 2,j) && ...
                (stage1resultPad(i ,j + 2) || stage1resultPad(i + 1,j + 2) || stage1resultPad(i + 2,j + 2));
            VeeBranch3 = stage1resultPad(i + 2,j) && stage1resultPad(i + 2,j + 2) && ...
                (stage1resultPad(i ,j ) || stage1resultPad(i ,j + 1) || stage1resultPad(i ,j + 2));
            VeeBranch4 = stage1resultPad(i ,j + 2) && ...
                stage1resultPad(i + 2,j + 2) && ...
                (stage1resultPad(i ,j) || stage1resultPad(i + 1, j) || stage1resultPad(i + 2,j));
            % Diagonal Branch
            DiagonalBranch1 = stage1resultPad(i,j + 1) && ~stage1resultPad(i,j + 2) && ...
                ~stage1resultPad(i + 1, j) && stage1resultPad(i + 1,j + 2) && ...
                stage1resultPad(i + 2,j) && ~stage1resultPad(i + 2,j + 1);
            DiagonalBranch2 = ~stage1resultPad(i,j) && stage1resultPad(i,j + 1) && ...
                stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j + 1) && stage1resultPad(i + 2,j + 2);
            DiagonalBranch3 = ~stage1resultPad(i,j + 1) && stage1resultPad(i,j + 2) && ...
                stage1resultPad(i + 1, j) && ~stage1resultPad(i + 1,j + 2) && ...
                ~stage1resultPad(i + 2,j) && stage1resultPad(i + 2,j + 1);
            DiagonalBranch4 = stage1resultPad(i,j) && ~stage1resultPad(i,j + 1) && ...
                ~stage1resultPad(i + 1, j) && stage1resultPad(i + 1,j + 2) && ...
                stage1resultPad(i + 2,j + 1) && ~stage1resultPad(i + 2,j + 2);
            
            existanceMap(i,j) = ~(spur1 || spur2 || spur3 || spur4 || Single4C1 || Single4C2 || Single4C3 || Single4C4 || LCorner1 || LCorner2 || LCorner3 || LCorner4 || ...
                CornerCluster1 || CornerCluster2 || TeeBranch1 || TeeBranch2 || TeeBranch3 || TeeBranch4 || VeeBranch1 || VeeBranch2 || VeeBranch3 || VeeBranch4 || DiagonalBranch1 || DiagonalBranch2 || DiagonalBranch3 || DiagonalBranch4);
        end
    end
end

end