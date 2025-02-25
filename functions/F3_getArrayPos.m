function y = F3_getArrayPos(x)
% Returns the array position(s) for
% the specified element or isotope in
% the F3M isovec array/attribute that
% is tracked throughtout F3M blocks. 
% Elements should be specified as a
% lowercase string whereas isotopes
% should be specified as a element
% followed by the A number.
% 
% .. highlight:: matlab
% .. code-block:: matlab
%
%   F3_getArrayPos('c12')
%   ans =
%
%       19
%
%   F3_getArrayPos('c')
%   ans =
%
%       19    20    21    22
%
% Args:
%   x (string): The isotope or element that
%               should be found. Can also include
%               keywords `at1`, `at2`, and `all`.
%
% Returns:
%   array: y
%       The location of the specified element, isotope,
%       or keyword. For elements this is a [1,1] array
%       whereas isotopes are [n, 1] where n is the number
%       of tracked isotopes.

    if strcmp(x,'at1')
        y = 1676;
    elseif strcmp(x,'at2')
        y = 1677;
    elseif strcmp(x,'all')
        y = linspace(1,1677,1677);
    else

        for i=1:length(x)
        
            a = str2double(x(i));
        
            if ~isnan(a) && isreal(a)
                F = 0; %iso
                break;
            end
        
            F = 1; %ele
        
        end
        
            if F == 0
                y = F3_getIsoIdx(x);
            else
                y = F3_getElementSpan(x);
                
            end
        
    end
end