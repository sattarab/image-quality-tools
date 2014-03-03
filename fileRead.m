function [count_DC_one count_DC_zero count_DC_minus_one count_AC_one count_AC_zero count_AC_minus_one]= fileRead(filename)
    %fid = fopen(filename);
    %result = fscan(fid, '%u');
    %result = dlmread(filename, '\n');
    %load the file
    result = load(filename);
    result = transpose(result);
    dc_matrix = result(1, :);
    ac_matrix = result([2:end], :);
    
    count_DC_one = sum(dc_matrix == 1);
    count_DC_zero = sum(dc_matrix == 0);
    count_DC_minus_one = sum(dc_matrix == -1);
    
    count_AC_one = sum(ac_matrix == 1);
    count_AC_zero = sum(ac_matrix == 0);
    count_AC_minus_one = sum(ac_matrix == -1);
    figure(1);
    hist(dc_matrix, 2000);
    for i=2:63
        h = figure(i);
        hist(ac_matrix(i, :));
        name = strcat('ac', int2str(i));
        figure('visible','off');
        saveas(h,name,'jpg');
    end
end