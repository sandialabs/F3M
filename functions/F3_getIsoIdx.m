function y = F3_getIsoIdx(x)
% Returns the index of isovec
% for the given isotope. Expects
% a string input with an element
% followed by the A number without
% any hyphenation. This function is
% not to be used for general purpose
% lookups, instead use the more flexible
% F3_getArrayPos function.
%
% Args:
%   x (string): The isotope to find
%               the array position of.
%
% Returns:
%   array: y
%       The location in the isovec
%       array where the isotope is 
%       located.

    isolist = load('IsoList.mat');
    isolist = isolist.Z;

    idx = find(strcmpi(isolist,x));

    if isempty(idx)
        error('Isotope not found or available');
    end

    y = idx;
end