function MakeLibDark()

    %background color
    BG='[0.0863,0.0863,0.1686]';
    
    %block background color
    BGM='[0.5568,0.4117,0.1450]';
    
    %block foreground color
    FGC='[0.902,0.8118,0.6196]';


    fname = gcs;
    load_system(fname);
    
    R = find_system(fname,'LookUnderMasks','All','SearchDepth',10);
    A = find_system(fname, 'FindAll', 'on', 'Type', 'Annotation', 'AnnotationType', 'area_annotation');

    for BB=1:length(R)
        % Foreground
        try
            % red color
            if strcmp(get_param(R{BB},"ForegroundColor"),"[0.631400, 0.070600, 0.125500]")
                set_param(R{BB},"ForegroundColor",'[0.968627, 0.713725, 0.737255]');
            % blue color
            elseif strcmp(get_param(R{BB},"ForegroundColor"),"[0.090200, 0.513700, 0.607800]")
                set_param(R{BB},"ForegroundColor",'[0.784632, 0.929730, 0.961102]');

            % if already dark colored, pass
            elseif strcmp(get_param(R{BB},"ForegroundColor"),"[0.784632, 0.929730, 0.961102]") | ...
                    strcmp(get_param(R{BB},"ForegroundColor"),"[0.774599, 0.919697, 0.951069]") | ...
                    strcmp(get_param(R{BB},"ForegroundColor"),"[0.968627, 0.713725, 0.737255]")

                continue;

            % everything else
            else
                set_param(R{BB},"ForegroundColor",FGC);
            end
            
        catch            
        end

        try
            % Background
            set_param(R{BB},"BackgroundColor",BGM);
        catch
        end

        try
            % Canvas 
            set_param(R{BB},"ScreenColor",BG);
        catch
        end

    end
    
    % Annotation area color
    for BB = 1:length(A)
        set_param(A(BB),"BackgroundColor","[0.1647, 0.1647, 0.3176]");
    end

end