close all
clear
clc

%% FETCH AUDIO FILES AND READ IN
audio_path = "All_Numbers/";
audio_files = audioDatastore("All_Numbers\", "FileExtensions", '.wav'); % read in all .wav files in audio path

if isempty(audio_files)
    error('No audio files found in given directory!')
end

% Calculate FFTs and plot
% fft_results = zeros(10, 10);
% 
% for idx = 1:min(length(audio_files.Files), 10*10)
%     [x, Fs] = audioread(audio_files.Files{idx});
%     X = fft(x);
% 
%     subplot(10, 10, idx);
%     plot(abs(X));
%     title(sprintf('File %d', idx));
% end

%% SPLICE AUDIO INTO DIGITS
all_phone_numbers = {};

% This chunk of code will calculate the energy of the signal
% then find the transitions from periods of low energy to high
% then splice the array, splitting each digit in the phone number!
% These digits are then saved to a cell, which is then saved
% into a different cell, storing all phone numbers spliced up.
for j = 1:length(audio_files.Files)
    [x, Fs] = audioread(audio_files.Files{j});
    
    % find energy of signal
    window_size = 0.01*Fs;
    energy = mean(buffer(x.^2, window_size));
    low_threshold = 0.01;       % energy requited to be considered noise
    high_threshold = 0.03;      % energy required to be considered a tone
    window_correction = 200;    % used to cut off signal during the white noise
    prev_i = 1;
    sections = {};
    
    for i = 2:length(energy)
        % find where energy goes from low to high
        if(energy(i) >= high_threshold && energy(i-1) <= low_threshold)
            sections{end+1} = x(prev_i*window_size:(i*window_size-window_correction)); 
            prev_i = i;
        end
    end
    
    sections{end+1} = x(prev_i*window_size:end); % add last digit

    if length(sections) > 10 && length(sections) < 10
        disp("Invalid Audio File! File: ", audio_files.Files{j})
    end

    all_phone_numbers{end+1} = sections;
end

%% PROCESS EACH DIGIT
for i = 1:length(all_phone_numbers)
    phone_number = all_phone_numbers{i};

    for j = 1:length(phone_number)
        digit = phone_number{j};
        fft_digit = fft(digit);

        
    end
end
