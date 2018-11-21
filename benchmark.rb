# encoding: utf-8


require 'benchmark'

require_relative 'helper'



## "raw" string reader benchmark - no type inference and data conversion

n = 1000
# n = 2

Benchmark.bm(14) do |x|
  x.report( 'std:' )            { n.times do CSV.read( './MSFT.csv' ); end }
  x.report( 'split:' )          { n.times do read_csv( './MSFT.csv' ); end }
  x.report( 'split(tab):' )     { n.times do read_tab( './MSFT.tab' ); end }
  x.report( 'split(table)*:' )  { n.times do read_table( './MSFT.tab' ); end }
  x.report( 'split(table):' )   { n.times do read_table( './MSFT.txt' ); end }
  x.report( 'reader:' )         { n.times do CsvReader.read( './MSFT.csv' ); end }
  x.report( 'reader(tab):' )    { n.times do CsvReader.tab.read( './MSFT.tab' ); end }
  x.report( 'reader(table)*:' ) { n.times do CsvReader.table.read( './MSFT.tab' ); end }
  x.report( 'reader(table):' )  { n.times do CsvReader.table.read( './MSFT.txt' ); end }
  x.report( 'reader(json):' )   { n.times do CsvJson.read( './MSFT.json.csv' ); end }
  x.report( 'reader(yaml):' )   { n.times do CsvYaml.read( './MSFT.csv' ); end }

  x.report( 'hippie:' )         { n.times do HippieCSV.read( './MSFT.csv' ); end }
  x.report( 'wtf:' )            { n.times do WtfCSV.scan( './MSFT.csv' );end }
  x.report( 'lenient:' )        { n.times do LenientCSV.read( './MSFT.csv' ); end }
end


###
# n = 1000
#                       user     system      total        real
#  std:             9.046000   0.281000   9.327000 (  9.320181)
#  split:           1.844000   0.203000   2.047000 (  2.048512)
#  split(tab):      1.797000   0.219000   2.016000 (  2.019056)
#  split(table)*:   3.969000   0.234000   4.203000 (  4.210268)
#  split(table):    4.156000   0.250000   4.406000 (  4.417928)
#  reader:         99.438000   0.469000  99.907000 ( 99.937307)
#  reader(tab):     1.875000   0.297000   2.172000 (  2.162532)
#  reader(table)*:  5.484000   0.266000   5.750000 (  5.760220)
#  reader(table):   5.719000   0.187000   5.906000 (  5.914888)
#  reader(json):    5.984000   0.281000   6.265000 (  6.257991)
#  reader(yaml):  119.688000  54.329000 174.017000 (174.166399)
#  hippie:         13.859000   0.531000  14.390000 ( 14.417702)
#  wtf:            28.547000   0.390000  28.937000 ( 28.937469)
#  lenient:         5.281000   0.235000   5.516000 (  5.508425)
