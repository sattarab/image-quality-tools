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
    figure(2);
    hist(ac_matrix(1, :));
    figure(3);
    hist(ac_matrix(35, :));
    figure(4);
    hist(ac_matrix(63, :));
end