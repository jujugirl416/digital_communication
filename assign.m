
% Muahahaha I will compress everything%
vid = VideoReader('test_vid.mp4');
I = read(vid, 1);
nf= vid.NumberOfFrames();
sampled = zeros([size(I,1) size(I,2) 3 (nf-1)/2], class(I));
j=1;
error_f = zeros(1, (nf-1)/2);
err_val = 0;
for k=0:(nf-1)/2
    j
    clc
    if j<nf
        j=j+2;
        frame = read(vid,j);
        [q_frame, err]= quantizer(frame,7,k);
        for a=1:360
            for b=1:640
                for c=1:3
                    err_val = err_val + err(a,b,c);
                end
            end
        end
        err_f(k+1)= err_val/(360*640*3);
        sampled(:,:,:,k+1)= q_frame;
    end 
end
implay(sampled)