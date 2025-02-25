%Usage: coloring of default simulink blocks
libs = "temp_mdl";


%R=find_system(mdl,'LookUnderMasks','All');
%set below in template
%DefaultBlockBackgroundColor
%DefaultBlockForegroundColor
%note colors must be in range [0,1]

%background color
BG='[0.0863,0.0863,0.1686]';

%block background color
BGM='[0.5568,0.4117,0.1450]';

%block foreground color
FGC='[0.9020,0.8118,0.6196]';

mdl = libs;
load_system(mdl);
R=find_system(mdl,'LookUnderMasks','All');

for BB=1:length(R)
    try

    catch
    end
end

for BB=1:length(libs)
    mdl = libs(BB);
    load_system(mdl);
    R=find_system(mdl,'LookUnderMasks','All');

    for i=1:length(R)
    
        try             
            
            set_param(R{i},'ForegroundColor',FGC);          
            
            
        catch
        end
        
        
        try
            set_param(R{i},'BackgroundColor',BGM);
        catch
        end
        
        
        try
            set_param(R{i},'ScreenColor',BG);
        catch
        end
        
    end
    
    annotations=find_system(mdl,'FindAll','on','Type','annotation');
    
    
    for i=1:length(annotations)
        set_param(annotations(i),'BackgroundColor',BGM);
        set_param(annotations(i),'FontSize','10');
        set_param(annotations(i),'FontName','DM Mono Medium');
        try
            set_param(annotations(i),'ForegroundColor',FGC);
        catch
        end
    end

end


    