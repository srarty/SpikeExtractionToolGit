% GETTOOLTIPS Retrieves the list of all tooltips requested by objectName
%
% Syntax: str = getTooltips(objectName);
%
% Inputs:
%     objectName - Cell vector: String or strings containing the names of
%                  the objects for which to retrieve the tooltip.
%     
% Outputs:
%     str - Cell vector: String/s with the tooltip.
%
% NOTE: To ensure a tooltip is set at the start, add the element to
% 'object' in setTooltips.m
%
% See also: setTooltips
%
% Artemio - 11/July/2019
function str = getTooltips(objectName)
   % Create the list of all available tooltip strings
   tooltips = struct(...
      'access_voltage',                      'Creates a variable in the Workspace with current data',                                     ...
      'add_voltage_button',                  'Load a new recording file. Doesn'' clear current data',                                     ...
      'automatic_params',                    sprintf('If ticked, the parameters are set autmatically. \nUntick this box to set parameters manually.'),...
      'clear_voltage_button',                'Removes currently active data',                                                             ...
      'curr_signal',                         'Chose a signal to plot and analyse',                                                        ...
      'load_voltage_button',                 'Load a recording file (will remove all the currently loaded data)',                         ...
      'method_list',                         'Chose the method to run selected action',                                                   ...
      'method_list_amplitude_change',        sprintf('Chose the method to run selected action\nAmplitude Change'),                        ...
      'method_list_autocorrelation',         'Plot the autocorrelation (lagged correlation) between rate timeseries',                     ...
      'method_list_interspike_interval',     'Display the interspike interval - histogram of time between spikes - for each axon family', ...
      'method_list_k_means',                 sprintf('Chose the method to run selected action\nK-means'),                                 ...
      'method_list_matched_filter',          sprintf('Chose the method to run selected action\nMatched Filter'),                          ...
      'method_list_merge_spikes',            'Merge selected spike trains',                                                               ...
      'method_list_particle_filter',         sprintf('Chose the method to run selected action\nParticle Filter'),                         ...
      'method_list_psth',                    'Generate a peri-stimulus time histogram for the spike timeseries',                          ...
      'method_list_recursive_least_squares', sprintf('Chose the method to run selected action\nRecursive Least Squares'),                 ...
      'method_list_threshold',               'Identify action potentials from spikes, extracted via threshold and duration of positive and negative comonents of an action potential',                                                       ...
      'method_list_truncate',                'Truncate voltage in time or seconds',                                                       ...
      'method_list_user_selection',          sprintf('Chose the method to run selected action\nUser Selection (Manual)'),                 ...
      'method_list_variance',                'Spike maxima must have peak greater than this many standard devitions of noise', ...
      'new_figure',                          'Open a new ''Spike Extraction Tool'' window and loads currently active data',               ...
      'new_figure_workspace',                'Loads the current data into a variable in the workspace and plots it on a figure',               ...
      'reset_button',                        sprintf('Reset zoom\nThe plotting area will display the whole recording'),                                                                                ...
      'run_tool_button',                     'Run',                                                                                       ...
      'run_tool_denoise',                    'Denoise: clean the recording',                                                              ...
      'run_tool_delete_templates',           'Remove one or more templates',                                                              ...
      'run_tool_extract_spikes',             'Extract spikes',                                                                            ...
      'run_tool_firing_rate',                'Average spike time series to get firing rate over time',                                    ...
      'run_tool_identify_ap_templates',      'Identify templates',                                                                        ...
      'run_tool_merge_templates',            'Merge two or more templates',                                                               ...
      'run_tool_rescale',                    'Rescale: remove drift from current recording',                                              ...
      'run_tool_statistics',                 'Statistics',                                                                                ...
      'run_tool_spike_operations',           'Merge or delete selected spike trains',                                                     ...
      'run_tool_utilities',                  'Merge or truncate data timeseries',                                                      ...
      'scroll_axes_slider',                  'Scroll down to view more templates',                                                        ...
      'set_tool_params',                     'Chose the paramaters for the selected tool',                                                ...
      'save_voltage',                        'Save current data in a file',                                                               ...
      'tool_list',                           'Chose an action',                                                                           ...
      'tool_list_denoise',                   sprintf('Choose an action\nDenoise - remove noise'),                                          ...
      'tool_list_delete_templates',          sprintf('Choose an action\nDelete template'),                                                 ...
      'tool_list_extract_spikes',            sprintf('Choose an action\nExtract spikes - extract spikes from chosen recording'),           ...
      'tool_list_firing_rate',               sprintf('Choose an action\nFiring rate'),                                                     ...
      'tool_list_identify_ap_templates',     sprintf('Choose an action\nIdentify AP templates - Identify different action potential groups'),...
      'tool_list_merge_templates',           sprintf('Choose an action\nMerge'),                                                           ...
      'tool_list_rescale',                   sprintf('Choose an action\nRescale - remove drift from current recording'),                   ...
      'tool_list_statistics',                sprintf('Choose an action\nStatistics - Explore the statistics of the extracted families'),   ...
      'tool_list_spike_operations',          'Merge or delete selected spike trains',                                                     ...
      'tool_list_utilities',                 'Select number of samples or seconds to truncate',                                           ...
      'toggleZoomButton',                    'Zoom/Displace (toggle sliders function)',                                                   ...
      'toggleZoomButton_toZoom',             'Toggle sliders function to Zoom (currently displacing)',                                    ...
      'toggleZoomButton_toDisplace',         'Toggle sliders function to Displace (currently zooming)',                                   ...
      'time_slider',                         'Zoom/Displacement. Click arrows for a small jump. Click the bar for a big jump',            ...
      'voltage_slider',                      'Zoom/Displacement. Click arrows for a small jump. Click the bar for a big jump'             ...
   );

   % Create output variable as an empty cell
   str = cell(1,length(objectName));
   
   for i = 1:length(objectName)
      try
         % Replace any space in the object name for an underscore
         objectName{i}(strfind(objectName{i}, ' ')) = '_';
         % Assign each tooltip string to the i-th cell. There will be i
         % output string cells for i input object names
         str{i} = tooltips.(objectName{i});
      catch
         % Most likely it didn't find the desired tooltip string
         % Return empty string.
         str{i} = '';
         % And print a message
         msgStr = sprintf('\tThe tooltip ''%s'' does not exist\n', objectName{i});
         printMessage('off', 'Text', msgStr);
      end
   end

end