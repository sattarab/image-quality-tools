%script for reading the file names and converting it to the appropraite
%name 

%Directory of the files
function changeName(location)
    % example location = 'C:\Users\abdullah\Desktop\design project\DesignProject\Image Set\';
    % Retrieve the name of the files only
    names = dir(location);
    names = {names(~[names.isdir]).name};
    % Calculate the length of each name and the max length
    len  = cellfun('length',names);
    mLen = max(len); 
    % Exclude from renaming the files long as the max 
    idx   = len < mLen;
    len   = len(idx);
    names = names(idx);

    % Rename in a LOOP
    for n = 1:numel(names)
        oldname = [location names{n}];
        newname = strcat('image', int2str(n), 'Orig.jpg');
        dos(['rename "' oldname '" "' newname '"']); % (1)
    end
end