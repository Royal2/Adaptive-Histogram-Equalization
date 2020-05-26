function [enhanced_image] = AHE(im,win_size)
%Adaptive Historgram Equalization, AHE()
%   inputs: image, contextual region size
%   output: enhanced image after AHE

    %padding image
    padded_image=padarray(im,[size(im,1), size(im,2)],'symmetric');
    output=zeros(size(im,1),size(im,2));
    %algorithm
    for r=0:1:size(im,1)-1
        for c=0:1:size(im,2)-1
            %for each pixel, (r,c)
            rank=0;
            %contextual region is the window size centered around (r,c)
            r_window=(size(im,1)+r)-((win_size-1)/2):(size(im,1)+r)+((win_size-1)/2);
            c_window=(size(im,2)+c)-((win_size-1)/2):(size(im,2)+c)+((win_size-1)/2);
            contextual_region=padded_image(r_window,c_window);
            for i=0:1:size(contextual_region,1)-1
                for j=0:1:size(contextual_region,2)-1
                    if(im(r+1,c+1)>im(i+1,j+1))
                        rank=rank+1;
                    end
                end
            end
            image=im(r+1,c+1)+(rank*255)/(win_size*win_size);   %adding to original pixel value
            output(r+1,c+1)=image;
            %output(r+1,c+1)=(rank*255)/(win_size*win_size);
        end
    end
    enhanced_image = output;
end

