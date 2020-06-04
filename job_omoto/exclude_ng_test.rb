# puts 'Hello World !'
# text = 'すもももももももものうち'
# nm = Natto::MeCab.new
# nm.parse(text) do |n|
#   puts "#{n.surface}\t#{n.feature}"
# end
# nm = Natto::MeCab.new('')
#
# query = '考える技術'
#
# nm.parse(query) do |n|
#       puts n.surface
#       puts n.feature
#   end






require 'natto'
require 'json'
# require 'unf'
require './tmp_ng_list'


#-----------------------------------#
# 'buffer file' @fetch_gcs_file.rb
#----------------------------------#
buffer = ['考える技術', '全年齢対応', '考える技術','統計学入門', '考える技術', 'adult', 'drug', 'ng', 'カタカナ', '統計学入門','考える技術']




# $normalizer = UNF::Normalizer.instance
  def normalize_string(str)
    return "" if str.nil? || str == ""
    str = str.scrub
    str.gsub!("\u0000", '')
    # str = $normalizer.normalize(str, :nfkc)
    str.gsub!(/\s+/, " ")
    str.gsub!(/[[:space:]]+/, " ")
    str.gsub!(/[[:blank:]]+/, " ")
    str.strip!
    return str
  end



#----------------------------#
#       exclude NG words
#----------------------------#
  ng_list.each do |ng|
    if buffer.include?(ng) then
      buffer.delete(ng)
    end
  end




  table = {}

  buffer.each do |line|

    query = normalize_string(line)

    table[query] = 0 if ! table.key? query

    table[query] += 1

  end


  table.keys.sort{|a, b| table[b] <=> table[a] }.each do |q|

    obj = {
      query: q,
      count: table[q]
    }

    puts obj.to_json

  end
