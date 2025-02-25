function y = F3_getElementSpan(x)
% Retrieves the array indicies of
% isovec that correspond to the given
% element. Multiple indicies are returned
% if multiple isotopes of that element are
% tracked. This function is
% not to be used for general purpose
% lookups, instead use the more flexible
% F3_getArrayPos function.
%
% Args:
%   x (string): The element to find
%               the array positions of.
%
% Returns:
%   array: y
%       The locations of isotopes tracked
%       for the given element. The shape of
%       the array is [n, 1] where n is the
%       number of isotopes tracked.

    x = lower(x);
    isolist = load('IsoList.mat');
    isolist = isolist.Z;

    letterfinalidx = 0;

    for i=1:length(x)

        a = str2double(x(i));

        if isnan(a)
            letterfinalidx = letterfinalidx+1;
        else
            break;
        end

    end

    lettersearch = x(1:letterfinalidx);

    letterspan = [];

    for i=1:length(isolist)

        FF = char(isolist(i));
        

        if strcmp(FF(1:letterfinalidx),lettersearch)
            if ~isnan(str2double(FF(letterfinalidx+1)))
                letterspan = [letterspan, i];
            end
        end

    end

    if isempty(letterspan)
        error('Element not found!');
    end

    y = letterspan;

end