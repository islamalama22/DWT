%% Load host and watermark images
clc;
close;clear;
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
rng('default'); % Reinitialize the random number generator to its startup configuration

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

%% Add Poisson noise to watermarked image
watermarkedImage_noise = imnoise(watermarkedImage, 'poisson');

%% Display and save watermarked image
figure, imshow(watermarkedImage); title('Watermarked Image');
figure, imshow(watermarkedImage_noise); title('Watermarked Image noise');

imwrite(watermarkedImage, 'dwt watermarked befor noise pepper.jpg');
imwrite(watermarkedImage_noise, 'dwt watermarked after noise pepper.jpg');

%% Extract watermark from watermarked image using the same pseudo-random sequence
extractedWatermark = zeros(size(watermarkImageResized));
for i = 1:size(watermarkedImage_noise,3)
    channel = watermarkedImage_noise(:,:,i);
    for j = 1:size(channel,1)
        for k = 1:size(channel,2)
            if randomSequence(j,k) > alpha *0.2 
                extractedWatermark(j,k,i) = (channel(j,k) - hostImage(j,k,i))/ (alpha*0.1) ;
            end
        end
    end
end

%% Display and save extracted watermark
figure, imshow(uint8(extractedWatermark)); title('Extracted Watermark noise ');
imwrite(uint8(extractedWatermark), 'dwt extreaction after noise pepper .jpg');
