function y = F3_makeEntityIsos(fuelIdx, itemsize, fuel_params)
% Initalize a spent fuel entity to be used
% in the SNF generator block.
%
% .. WARNING::
%   This function assumes the standard database organization
%   described in the tutorial is followed. It must be
%   modified if you use a non-standard database organization.
%
% Args:
%
%   fuelIdx (int): Flag to indicate whether or not to randomize the fuel
%                  parameters. If 1, then chose a random combination of
%                  burnup, enrichment, and deacy. Otherwise, use the 
%                  supplied values. 
%
%   itemsize (float): Value to scale the database concentrations by. The
%                     database has values that are g/MTIHM so this must be
%                     scaled to units of kg using this user supplied value
%
%   fuel_params(array): Array with shape [1, 5] that contains fuel
%                       parameter indicies. The indicies are as follows:
%
%                       * 1: burnup index for array `b`
%                       * 2: enrichment index for array `e`
%                       * 3: decay index for array `c`
%                       * 4: optional attribute for isovec(1676)
%                       * 5: optional attribute for isovec(1677)                          
%   
% Returns:
%   array: y
%              A vector with shape (1677,1) containing the 1675 isotopes
%              tracked by F3M and two optional values at index 1676 and
%              1676. Used as the `isovec` attribute of a SNF entity.

        

    %These must still be specified since
    %they are used inside simulink
    coder.extrinsic('num2str');
    coder.extrinsic('h5read');
    coder.extrinsic('strcat');
    isovec=zeros(1675,1);
    y = zeros(1677,1);

    b=[33 45 60];
    e=[2.60 3.30 4.00 4.70 5.40]; %9
    c=[1 5 10 25 50]; %5



    if fuelIdx == 1 %random fuel
        RnG=floor(rand(1)*3 +1);
        RnG2=floor(rand(1)*5 +1);
        RnG3=floor(rand(1)*5 +1);
        
        burnup=num2str(b(RnG));
        enrichment=num2str(e(RnG2),'%.2f');
        cool=num2str(c(RnG3));
        

        isovec = (h5read('LargeDatV2.h5',strcat('/W17_',burnup,'_',enrichment,'/',cool))  *itemsize)';

    else %specific fuel
        burnup=num2str(b(fuel_params(1)));
        enrichment=num2str(e(fuel_params(2)),'%.2f');
        cool=num2str(c(fuel_params(3)));

        isovec = (h5read('LargeDatV2.h5',strcat('/W17_',burnup,'_',enrichment,'/',cool))  *itemsize)';
    end

    y(1:1675) = isovec;
    y(1676) = fuel_params(4);
    y(1677) = fuel_params(5);

end