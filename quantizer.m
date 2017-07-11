% THE FOLLOWING FUNCTION QUANTIZES EVERY PLANE (R G and B) IN THE IMAGES

function [q_image, q_error]= quantizer(input_image, no_levels, count)
I = input_image;
%generating thresholds for each of the 3 planes
threshForPlanes = zeros(3, no_levels);
%thresholding planes for R G AND B planes of the frame
for i = 1:3
    threshForPlanes(i,:) = multithresh(I(:,:,i),no_levels);
end
quantPlane = zeros( size(I) );
x = zeros( size(I) );

%quantization of each of the planes
for i = 1:3
    value = [0 threshForPlanes(i,2:end) 255]; 
    quantPlane(:,:,i) = imquantize(I(:,:,i),threshForPlanes(i,:),value);
end
q_image = uint8(quantPlane); 

q_error = I - q_image;
size(q_error);
imshowpair(q_image,input_image,'montage');

title('Quantized_Frame Original_Frame')