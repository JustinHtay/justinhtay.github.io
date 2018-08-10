img = imread('NHBB.png');
mask2 = [];
[r,c,~] = size(img);
for x = 1:r
    row = false(1,c);
    rmask = img(x,:,1) > 125 & img(x,:,2) < 50 & img(x,:,3) < 50;
    bmask = img(x,:,1) < 50 & img(x,:,2) < 120 & img(x,:,3) > 125;
    mask = rmask | bmask;
    inds = find(mask);
    row(1:min(inds)) = true;
    row(max(inds):end) = true;
    if isempty(inds)
        row = ~row;
    end
    mask2 = [mask2;row];
end
imwrite(img,'NHBB-1.png','Alpha',double(~mask2));