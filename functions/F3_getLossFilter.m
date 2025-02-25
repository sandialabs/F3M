function y = F3_getLossFilter(frac, lossOverrideTab)
% Generate an array of fractions from parameters
% specified in a mask dialog. By default, this
% function generates an array of identical values
% that has the same shape as `isovec`, but
% individual values can be overriden by the
% override table provided in the mask dialog.
%
% This block does not account for any replacement
% material that might be specified in a replacement
% dialog table. The loss filter is "blind"
% to any replacement. Instead of calculating
% a net loss/replacement by considering both
% the loss and replacement specification together,
% they are considered separately as to differen terms.
% This is because it is more realistic to consider 
% loss and replacement separately.
% 
% For example, suppose a species is specified as
% both a loss component and replacement component.
% Rather than considering the net change, both terms
% are carried out in their entirety (i.e., loss
% followed by replacement/gain).
%
% Args:
%   frac (float): A float representing the fraction 
%                 with which to reduce all species in
%                 `isovec`. Values should be :math:`\in [0,1]`
%                 otherwise and exception will be thrown.
%
%   lossOverrideTab (array): A [N,2] shaped array where column 1
%                            represents isovec array indicies and
%                            column 2 represents fractions. These
%                            entries override the provided `frac`.
%                            Values should be :math:`\in [0,1]` 
%                            otherwise an exception will be thrown.
%
% Returns:
%   array: y
%       An array with shape [1677,1] containing fractions :math:`\in [0,1]`
%       with which to reduce `isovec`.

    % if frac > 0
    %     throw(MException('F3_calculateLossEntity:invalidFraction','Only loss fraction <=0 are permitted'))
    % end



    y = ones(1677,1)*frac;

    % it's possible to zero out the replacement
    % isotopes here, but it's more relaistic
    % to simulate the simulaneous loss and
    % addition of the replacement material
    % rather than just the net change

    % of course, this can be changed
    % by specifying something different
    % in the loss override table

    if ~isempty(lossOverrideTab)
        locs = lossOverrideTab(:,1);
        valsS = lossOverrideTab(:,2);

        % if sum(valsS<0) > 0
        %     throw(MException('F3_calculateLossEntity:invalidFraction','Only loss fraction <=0 are permitted'))
        % end
        
        vals = zeros(length(valsS),1);
        
        for i=1:length(vals)
            n = str2double(valsS(i));
            if ~(isnan(n))
                y(F3_getArrayPos(char(locs(i)))) = n;
            end
            
        end
    end

end