function y = F3_ptableToArray(tab,sumtovalue)
% Convert a cell array from a mask dialog table
% into an array useable for downstream
% tasks. Typically used in loss and
% process blocks. Requires specified fractions
% in `tab` to be :math:`\in[0,1]`.
% 
% Args:
%   tab (cell array): Array containing entries that
%                     specify elements or isotopes
%                     to be modified. Column 1 specifies
%                     indicies of isovec to be modified
%                     whereas column 2 specifies the fracions
%                     to be applied. 
%                     
%   
%   sumtovalue (boolean): If true, then normalize
%                         the supplied fractions to 1
%
% Returns:
%   array: y
%       The modification array which has shape [2,n]. Column 1 specifies
%       indicies of `isovec` whereas column2 specifies the modification
%       fractions.
%       

    if sum(size(tab)) == 0
        error('No loss fractions specified!')
    else

        locs = tab(:,1);
        valsS = tab(:,2);
        vals = zeros(length(valsS),1);



        for i=1:length(vals)
            n = str2double(valsS(i));
            if isnan(n) || n > 1 || n < 0
                error('Invalid loss fraction!');
            else
                vals(i) = n;
            end
        end

        for i=1:length(locs)
            n = F3_getArrayPos(char(locs(i)));

            %should the supplied fraction sum to
            %1 over the requested value or not
            if sumtovalue == false
                fa2 = ones(1,length(n))*vals(i);
            else
                fa2 = ones(1,length(n))*(vals(i)/length(n));
            end
            

            if i == 1
                arraylocs = n;
                fracarray=fa2;
            else
                arraylocs = [arraylocs,n];
                fracarray = [fracarray,fa2];
            end
            
            
            
            

        end
    end

    y = [arraylocs;fracarray];

end