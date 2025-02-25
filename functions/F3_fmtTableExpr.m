function y = F3_fmtTableExpr(stin)
% Evaluates a string containing mathematical
% expressions that contain variables defined
% in the model workspace. This function is used
% to evaluate input from F3M mask dialogs for 
% use in downstream processing tasks. This block
% is only designed for simple expressions with
% defined variables in the model workspace. 
% 
%
% .. IMPORTANT::
%    This block is fairly simple and does
%    not respect parenthetical ordering, instead
%    it simply processes expressions in order from
%    left to right. 
% 
% Args:
%   stin (string): A string containing a mathematical
%                  expression.
% Returns:
%   string: y
%       The evaluated expression as a string.
%
% .. highlight:: matlab
% .. code-block:: matlab
%
%   model_workspace = get_param(bdroot,'ModelWorkspace');
%   x = 3; assignin(model_workspace,'x',3);
%   y = 2; assignin(model_workspace,'y',2);
%   z = 5; assignin(model_workspace,'z',5);
%   stin = "x*y*z";
%   F3_fmtTableExpr(stin)
%   ans =
%
%       '30'

    variable_strings = split(stin,["+","-","*","/"]);
    model_workspace = get_param(bdroot,'ModelWorkspace');

    for i=1:length(variable_strings)
        A = variable_strings(i);
        
        %only replace if its note a number
        if isnan(str2double(A{1}))
            stin = replace(stin,A{1},num2str(model_workspace.getVariable(A{1}),16));
        end
    end



    y = num2str(eval(stin),16);
end