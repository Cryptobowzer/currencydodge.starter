# encoding: utf-8

def read_csv( path )
  recs = []
  File.open( path, 'r:utf-8' ) do |f|
     f.each_line do |line|
       ##  note: chomp('') if is an empty string,
       line   = line.chomp( '' )    ## fix: use line.chomp!  inplace - why? why not?
       values = line.split( ',' )
       recs << values
     end
  end
  recs
end



def read_tab( path )
  recs = []
  File.open( path, 'r:utf-8' ) do |f|
     f.each_line do |line|
       ##  note: chomp('') if is an empty string,
       line   = line.chomp( '' )  ## fix: use line.chomp!  inplace - why? why not?
       values = line.split( "\t" )
       recs << values
     end
  end
  recs
end


def read_table( path )
  recs = []
  File.open( path, 'r:utf-8' ) do |f|
     f.each_line do |line|
       ##  note: chomp('') if is an empty string,
       line   = line.chomp( '' )   ## fix: use line.chomp!  inplace - why? why not?
       values = line.split( /[ \t]+/ )
       ## translate interpunct back to space
       ## values = values.map { |value| value.tr( '•', ' ' ) }
       recs << values
     end
  end
  recs
end



if __FILE__ == $0

require 'pp'

data = read_csv( 'MSFT.csv' )
pp data
date = read_tab( 'MSFT.tab' )
pp data
data = read_table( 'MSFT.txt' )
pp data[0..2]


end
