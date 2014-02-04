clear
close all
clc

R1 = zeros(40);
G1 = R1;
B1 = R1;

% Starting point of coloured objects
r1 = 20;
c1 = 20;

% Draw triangle
% w = zeros(5,9);
% k = 1;
% for step = 1:2:9    
%     z = (9 - step)/2;
%     w(k,:) = [zeros(1,z) ones(1, step) zeros(1,z)];
%     k = k+1;
% end
% R1(r1:r1+4,c1:c1+8) = w;

R1(r1:r1+2,c1:c1+2) = 0.99;
G1(r1:r1+2,c1:c1+2) = 0;
B1(r1:r1+2,c1:c1+2) = 0;

num_frames = 16; 
stepSize = 4;

% Starting point of coloured objects
r1 = 2;
c1 = 20;
r2 = 37;
c2 = 20;

% Set frequency (Hz) of movement of objects
freq = 100;                % in Hz
pause_duration = 1/freq;  % in secs

while(1)    
    for k = 1:num_frames
        % Reset the frame to all black before rendering each frame
        R1 = zeros(40);
        G1 = R1;
        B1 = R1;
        R2 = R1;
        G2 = R1;
        B2 = R1;
        % Create red square of size 2 x 2
        R1(r1:r1+2,c1:c1+2) = 0.99;
        G1(r1:r1+2,c1:c1+2) = 0;
        B1(r1:r1+2,c1:c1+2) = 0;

        % Create green rectangle of size 2 x 2
        R2(r2:r2+2,c2:c2+2) = 0;
        G2(r2:r2+2,c2:c2+2) = 0.88;
        B2(r2:r2+2,c2:c2+2) = 0;

        % Control direction and step size of movement per frame    
        if (k <= num_frames/4)
            rx1 = stepSize;
            cx1 = -stepSize;
            rx2 = -stepSize;
            cx2 = stepSize;         
        elseif (num_frames/4 < k) && (k <= num_frames/2)
            rx1 = stepSize;
            cx1 = stepSize;
            rx2 = -stepSize;
            cx2 = -stepSize; 
        elseif (num_frames/2 < k) && (k <= 3*num_frames/4)
            rx1 = -stepSize;
            cx1 = stepSize;
            rx2 = stepSize;
            cx2 = -stepSize; 
        elseif (3*num_frames/4 < k) && (k <= num_frames)
            rx1 = -stepSize;
            cx1 = -stepSize;
            rx2 = stepSize;
            cx2 = stepSize; 
        end

        r1 = r1 + rx1;
        c1 = c1 + cx1;     
        c2 = c2 + cx2; 
        r2 = r2 + rx2;
        % construct the RGB image by concatenating the R, G and B matrices
        image1 = cat(3,R1,G1,B1);
        image2 = cat(3,R2,G2,B2);
        final_image = image1 + image2;
        imagesc(final_image);
        pause(pause_duration);
    end
end