require 'open-uri'
require 'archive'
require 'rmagick'
include Magick
open('img.tar.gz', 'wb') do |fo|
  fo.print open('https://github.com/Arafatk/language-basics/raw/master/img.tar.gz').read
end
a = Archive.new("img.tar.gz")
a.extract
Dir.foreach(File.dirname(__FILE__)) do |fname|
  puts fname if fname.end_with? "png" 
  if fname.end_with? "png" 
         image = ImageList.new(fname)
         image3 = image.quantize(number_colors = 256)
         image2 = Image.new(image.columns, image.rows)
 
         (0..image.columns).each do |x|
          (0..image.rows).each do |y|
            pixel = image3.pixel_color(x, y)
            r_16bit=pixel.red

            r_8bit = r_16bit & 255
            # RGB value of the image 
            print r_8bit, " "
          end
          print "\n"
        end  
        print "\n\n\n\n\n"
    end
  
end

