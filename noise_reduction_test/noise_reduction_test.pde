// Noise reduction on image by Christian Tsalidis
// This reduces the noise of pixels that are not in grouped colors
void setup() {
  fullScreen();
  PImage current = loadImage("image.png");
  PImage reducedNoiseImg = createImage(current.width, current.height, RGB);
  int skip = 4;
  // to avoid the noise 
   // Go though all the neighbouring pixels to the current pixel in the for loops
   // caclulate the sum of the elements that are colored (neither black or white)
   // to go through the nwighbouring elements, go through a kernel with a skip of 1
  reducedNoiseImg.loadPixels();
   for(int x = skip; x < current.width - skip; x++) {
     for(int y = skip; y < current.height - skip; y++) {
       int sum = 0; // the sum of all the elements of the kernel that are not white or black
       int pos = x + y * current.width;
       for(int kx = -skip; kx <= skip; kx++) {
         for(int ky = -skip; ky <= skip; ky++) {
           // calculate the neighbouring point to the current pixel
           int loc = (x + kx) + (y + ky)*current.width;
           if(current.pixels[loc] != color(0) && current.pixels[loc] != color(255)) { // it means that this pixel is colored
             sum++;
           }
         }
       }
       // if the sum is not 9 it means that this pixel should be set to the background color
       if(sum < 9*9) reducedNoiseImg.pixels[pos] = color(0);
       else reducedNoiseImg.pixels[pos] = current.pixels[pos];
     }
   }
   reducedNoiseImg.updatePixels();
   image(reducedNoiseImg, 0, 0);
   // image(current, 0, 0);
}

void draw() {}
