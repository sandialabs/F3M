function y = F3_ptableToFlow(tab,sumtovalue)
% Converts a mask dialog table to flow array
% to be used with a continuous signal in F3M.
% Similar to `F3_ptableToGain` but does not
% permit values outside the interval :math:`\in[0,\infty]`
% This function is commonly used for calculating flows
% which can be greater than zero, but can be used
% for a variety of purposes.
%
% Args:
%   tab (cell array): Array containing entries that
%                     specify elements or isotopes
%                     to be placed into an array.
%                     Column 1 specifies indicies of
%                     isovec whereas column 2 specifies
%                     the values of the array.
%
%                     
%   
%   sumtovalue (boolean): If true, then normalize
%                         the supplied fractions to 1
%
% Returns:
%   array: y
%       The flow array which has shape [1677,1] that contains
%       values :math:`\in[0,\infty]`.
    
    y = zeros(1677,1);
    
    if sum(size(tab)) == 0
        return
    else

        locs = tab(:,1);
        valsS = tab(:,2);
        for i=1:length(valsS)
            currentVal = valsS{i};
            if length(str2num(currentVal)) == 0
                valsS{i} = F3_fmtTableExpr(currentVal);
            end
        end
        vals = zeros(length(valsS),1);



        for i=1:length(vals)
            n = str2double(valsS(i));
            vals(i) = n;
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
                flowarray=fa2;
            else
                arraylocs = [arraylocs,n];
                flowarray = [flowarray,fa2];
            end
            
            
            
            

        end
    end

        y(arraylocs) = flowarray;


end