%% Load host and watermark images
hostImage = imread("PeppersRGB.jpg");
 figure, imshow(hostImage); title('Host Image');
watermarkImage = imread("water.jpg");
  figure, imshow(watermarkImage); title('Watermark Image');

%% Resize watermark to match host image
watermarkImageResized = imresize(watermarkImage, size(hostImage(:,:,1)));

%% Set secret key and alpha value

key = 1000;
alpha = 0.02;

%% Generate pseudo-random sequence for embedding and extraction from secret key
rng('default');
rng(key);
randomSequence = rand(size(hostImage,1), size(hostImage,2));

%% Embed watermark into host image
watermarkedImage = hostImage;
for i = 1:size(hostImage,3)
channel = hostImage(:,:,i);
for j = 1:size(channel,1)
for k = 1:size(channel,2)
if randomSequence(j,k) > alpha/0.4
watermarkedImage(j,k,i) = channel(j,k) + alpha*watermarkImageResized(j,k,i);
end
end
end
end

%% Display and save watermarked image
figure, imshow(watermarkedImage); title('Watermarked Image');
imwrite(watermarkedImage, 'dwt_ watermarked_ befor_noise_ pepper.jpg');

%% Extract watermark from watermarked image using the same pseudo-random sequence
extractedWatermark = zeros(size(watermarkImageResized));
for i = 1:size(watermarkedImage,3)
channel = watermarkedImage(:,:,i);
for j = 1:size(channel,1)
for k = 1:size(channel,2)
if randomSequence(j,k) > alpha/10
extractedWatermark(j,k,i) = (channel(j,k) - hostImage(j,k,i))/ (alpha*0.1) ;
end
end
end
end

%% Display and save extracted watermark
figure, imshow(uint8(extractedWatermark)); title('Extracted Watermark');
imwrite(uint8(extractedWatermark), 'dwt_extracted_befor_noise_ pepper.jpg');