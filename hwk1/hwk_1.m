clc
clear
close all

%% Establish Parameters
Fs = 8000;     % samp rate of 8 kHz
octave = 2;     % octave of tones
vol = 0.5;      % volume of tones
bpm = 240;      % speed expressed in beats per minute

%% Define notes
C = 130.8*octave;
D = 146.8*octave;
E = 164.8*octave;
F = 174.6*octave;
G = 196.8*octave;
A = 220.0*octave;
B = 246.9*octave;

%% Create notes and music waveforms

% twinkle twinkle little star
ttls_noteCell = {
    createNote(C, 1, vol, bpm, Fs),
    createNote(C, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),

    createNote(A, 1, vol, bpm, Fs),
    createNote(A, 1, vol, bpm, Fs),
    createNote(G, 2, vol, bpm, Fs),

    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),

    createNote(D, 1, vol, bpm, Fs),
    createNote(D, 1, vol, bpm, Fs),
    createNote(C, 2, vol, bpm, Fs),

    createNote(G, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),

    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(D, 2, vol, bpm, Fs),

    createNote(G, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),

    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(D, 2, vol, bpm, Fs),

    createNote(C, 1, vol, bpm, Fs),
    createNote(C, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),

    createNote(A, 1, vol, bpm, Fs),
    createNote(A, 1, vol, bpm, Fs),
    createNote(G, 2, vol, bpm, Fs),
    
    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),

    createNote(D, 1, vol, bpm, Fs),
    createNote(D, 1, vol, bpm, Fs),
    createNote(C, 2, vol, bpm, Fs)
};

jb_noteCell = {
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 2, vol, bpm, Fs),

    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 2, vol, bpm, Fs),

    createNote(E, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),
    createNote(C, 1.5, vol, bpm, Fs),
    createNote(D, 0.5, vol, bpm, Fs),

    createNote(E, 4, vol, bpm, Fs),

    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1.5, vol, bpm, Fs),
    createNote(F, 0.5, vol, bpm, Fs),

    createNote(F, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 0.5, vol, bpm, Fs),
    createNote(E, 0.5, vol, bpm, Fs),

    createNote(E, 1, vol, bpm, Fs),
    createNote(D, 1, vol, bpm, Fs),
    createNote(D, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),

    createNote(D, 2, vol, bpm, Fs),
    createNote(G, 2, vol, bpm, Fs),

    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 2, vol, bpm, Fs),

    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 2, vol, bpm, Fs),

    createNote(E, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),
    createNote(C, 1.5, vol, bpm, Fs),
    createNote(D, 0.5, vol, bpm, Fs),

    createNote(E, 4, vol, bpm, Fs),

    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),

    createNote(F, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 1, vol, bpm, Fs),
    createNote(E, 0.5, vol, bpm, Fs),
    createNote(E, 0.5, vol, bpm, Fs),

    createNote(G, 1, vol, bpm, Fs),
    createNote(G, 1, vol, bpm, Fs),
    createNote(F, 1, vol, bpm, Fs),
    createNote(D, 1, vol, bpm, Fs),

    createNote(C, 4, vol, bpm, Fs),
};

waveform = createMusic(jb_noteCell);

%% Play and save music

sound(waveform, Fs);
audiowrite('output.wav', waveform, Fs);
plot(waveform)

%% Music functions

% given an input of sinusoidals, concatenate them
function songArr = createMusic(noteCell)
    songArr = [];
    
    for i = 1:size(noteCell)
        songArr = [songArr, noteCell{i}];  % concat note
    end

end

% A function to create a sinusoidal of known freq, amp, and duration.
function note = createNote(freq, beats, vol, bpm, Fs)
    % convert parameter 'beats' into seconds, sampled @ Fs
    duration = (60/bpm) * beats;
    t = 0:(1/Fs):(duration);
    note = vol * cos(2*pi*freq*t) .* exp(-5*t / duration); % small exp. roll off to help with 'sharpness' of the sound and create a pause between each beat.
end
