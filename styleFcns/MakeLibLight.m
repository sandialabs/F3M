function MakeLibLight()

    %background color
    BG='[0.8745,0.8706,0.8902]';
    
    %block background color
    FGC='[0.5568,0.4117,0.1450]';
    
    %block foreground color
    BGM='[0.902,0.8118,0.6196]';


    fname = gcs;
    load_system(fname);
    
    R = find_system(fname,'LookUnderMasks','All','SearchDepth',10);
    A = find_system(fname, 'FindAll', 'on', 'Type', 'Annotation', 'AnnotationType', 'area_annotation');

    for BB=1:length(R)
        % Foreground
        try
            % Red color
            if strcmp(get_param(R{BB},"ForegroundColor"),"[0.968627, 0.713725, 0.737255]")
                set_param(R{BB},"ForegroundColor",'[0.631400, 0.070600, 0.125500]');
            % Blue color 
            % has two colors since MATLAB won't set the color
            % exactly according to the array
            elseif strcmp(get_param(R{BB},"ForegroundColor"),"[0.784632, 0.929730, 0.961102]") | strcmp(get_param(R{BB},"ForegroundColor"),"[0.774599, 0.919697, 0.951069]")
                set_param(R{BB},"ForegroundColor",'[0.0902, 0.5137, 0.6078]');
            %if already blue or red, ignore
            elseif  strcmp(get_param(R{BB},"ForegroundColor"),"[0.631400, 0.070600, 0.125500]") | ...
                    strcmp(get_param(R{BB},"ForegroundColor"),"[0.090200, 0.513700, 0.607800]")

                continue;
                    
            % Everything else
            else
                set_param(R{BB},"ForegroundColor",FGC);
            end
            
        catch            
        end

        try
            % Background Color
            set_param(R{BB},"BackgroundColor",BGM);
        catch
        end

        try
            % Canvas color
            set_param(R{BB},"ScreenColor",BG);
        catch
        end

    end
    
    % Annotation area color
    for BB = 1:length(A)
        set_param(A(BB),"BackgroundColor","[0.7922, 0.7843, 0.8157]");
    end

end