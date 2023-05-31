
host = imread("BaboonRGB.jpg");

watermarked_before_noise = imread("dwt all result\DWT image\dwt befor noise\dwt_ watermarked_ befor_noise_ bob.jpg");
watermarked_after_noise = imread("dwt all result\DWT image\dwt after noise\dwt watermarked after noise bob.jpg");

watermrkdata=imread("water.jpg");
watermrkdata_extrect_before_noise =imread("dwt all result\DWT image\dwt befor noise\dwt_extracted_befor_noise_ bob.jpg");
watermrkdata_extrect_after_noise =imread("dwt all result\DWT image\dwt after noise\dwt extreaction after noise bob .jpg");


host_H=histogram(host);
title('HOST histogram') ;
imwrite(host_H,'histogram  DWT host BOBoon .jpg');

watermarked_before_noise_H =histogram(watermarked_before_noise);
title('watermarked before noise') ;
  imwrite(watermarked_before_noise_H, 'histogram DWT watermarked befor noise boboon  .jpg');


watermarked_after_noise_H=histogram(watermarked_after_noise);
title('watermarked after noise') ;
 imwrite(watermarked_after_noise_H, 'histogram DWT watermarked after  noise boboon  .jpg');

watermrkdata_H=histogram(watermrkdata);
title('watermrkdata ') ; 
imwrite(watermrkdata_H ,'histogram waterdata ');

watermrkdata_extrect_before_noise_H=histogram(watermrkdata_extrect_before_noise);
title('watermarked extrect before noise') ;
 imwrite(watermarked_before_noise ,' histogram DWT watermarked extrect before noise boboon .jpg');

watermrkdata_extrect_after_noise_H=histogram(watermrkdata_extrect_after_noise); 
title('watermarked extrect after noise ');
imwrite(watermrkdata_extrect_after_noise_H ,' histogram DWT watermarked extrect after noise boboon .jpg') ;

 