function y = F3_inventoryTracker(isovec, utype)
% Create a persistent inventory variable
% to track a block's inventory. 
%
% Args:
%   isovec (array): An array of values that
%                   is used to update the persistent
%                   inventory variable. 
%
%
%   utype (int): An interger used to describe what
%                inventory update to perform. If
%                `utype` is 1 then `isovec` is added
%                to the inventory. Otherwise, `isovec`
%                is subtracted from the inventory.
%
% Returns:
%   array: y
%       The modified inventory after `isovec` has been
%       added or subtracted.

    persistent inventory

    if isempty(inventory)
        inventory = isovec;
    else
        if utype == 1 %addition
        inventory = inventory+isovec;
        else %subtraction
        inventory = inventory-isovec;
        end
    end

    y = inventory;

end
