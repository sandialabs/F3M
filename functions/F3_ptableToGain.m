function y = F3_ptableToGain(tab,sumtovalue)
% Converts a mask dialog table to gain array
% to be used with a continuous signal in F3M.
% Similar to `F3_ptableToFlow` but does not
% permit values outside the interval :math:`\in[0,1]`.
% Commonly used to calculate values for gain blocks
% representin process modifications, but can be
% used for a variety of purposes.
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
%       The gain array which has shape [1677,1] that contains
%       values :math:`\in[0,1]`.

    y = zeros(1677,1);

    if sum(size(tab)) == 0
        return
    else

        locs = tab(:,1);
        valsS = tab(:,2);
        vals = zeros(length(valsS),1);



        for i=1:length(vals)
            n = str2double(valsS{i});

            if isnan(n) || n > 1 || n < 0
                try
                    %might be a variable, so check
                    vals(i) = str2double(F3_fmtTableExpr(valsS{i}));
                catch
                    error('Invalid separation fraction!'); 
                end
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


        y(arraylocs) = fracarray;

end