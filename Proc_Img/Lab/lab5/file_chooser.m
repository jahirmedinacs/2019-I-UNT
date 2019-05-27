function path_output=file_chooser(path_ref, last, file_chosed)
  clc;
  if strcmp(file_chosed,'')
    printf('\nArchivo Seleccionado :\t VACIO');
  else
    printf('\nArchivo Seleccionado :\t %s | %s/', file_chosed, path_ref);
  end
  
  current_dir = dir(path_ref);  
  if last
    printf('\n\n');
    path_output = path_ref;
  else
    for ii=1:size(current_dir)(1)
      file_name = current_dir(ii);
      printf('\n(%d) \t >>>  %s', ii, file_name.name);   
      ii = ii + 1;
    end
    
    printf('\n(-1) \t >>> Terminar y Usar Archivo Seleccionado');   
    option_chosed = input('\n\nArchivo?\t:>>> ');

    if option_chosed == -1
      path_output = file_chooser(path_ref, true, file_chosed);
    else
      next_path = strcat(strcat(what(path_ref).path, '/'), current_dir(option_chosed).name);
      path_output = file_chooser(next_path, false, current_dir(option_chosed).name);
    end
  end
end