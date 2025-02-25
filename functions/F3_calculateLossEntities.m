function y = F3_calculateLossEntities(isovec,tab,etype)
% Calculate the removed entity component
% for use with various F3M process blocks.
%
% .. NOTE::
%   Fractions specified in row 2 of `tab` must be :math:`\in [0,1]`
%   otherwise an exception will be thrown.
%
% Args:
%
%   isovec (array): A vector array with shape [1677, 1] that
%                   represents all isotopes tracked by F3M. This
%                   array is read from the attributes of the entity
%                   that is being modified by the F3M block.
%
%   tab (array): An array with shape [2, n] where n is the number of
%                isotopes that are being modified. The first row,
%                [1, :], contains the locations of isotopes that are
%                being modified whereas the second row, [2, :] contains
%                the corresponding fractions, :math:`\in [0,1]` of the
%                input, isovec, that should be removed.
%
%   etype (int): An integer used to indicate if the output corresponds
%                to the removed component or the original component
%                after modification. A value of 0 indicates that
%                the modified component should be returned whereas
%                any other value indicates the removed component
%                should be returned.
%
% Returns:
%   array: y
%              A vector with shape (1677,1) containing the 1675 isotopes
%              tracked by F3M and two optional values at index 1676 and
%              1676. The specific details for the values of y depend
%              on the value passed for `etype`.

    
    arraylocs = tab(1,:);
    fracarray = tab(2,:);

    if sum(fracarray<0) > 0
        error('Only loss fraction <=0 are permitted')
    end

    s = size(tab);
    
    if etype == 0 %original entity
        if s(2) == 1
            isovec(arraylocs) = isovec(arraylocs)*(1-fracarray);
        else
            oarray = ones(size(fracarray));
            oarray = oarray-fracarray;
            isovec(arraylocs) = isovec(arraylocs).*oarray';
        end
        
        y = isovec;

    else %loss entity
        isovecloss = zeros(1677,1);
        if s(2) == 1
            isovecloss(arraylocs) = isovec(arraylocs)*fracarray;
        else
            isovecloss(arraylocs) = isovec(arraylocs).*fracarray';
        end

        y = isovecloss;

    end


end