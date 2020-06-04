

def ng_list

  #----------------------------------------#
  #            make NG lists
  #----------------------------------------#
  ng_list = []
  ng_list_adult = ['adult', 'sex', 'ng']
  ng_list_drug = ['drug']
  ng_list_sample = ['カタカナ']

  # ng_list.push(ng_list_adult)
  # ng_list.push(ng_list_drug)
  # ng_list.push(ng_list_sample)
  # ng_list.flatten!

  ng_list << ng_list_adult
  ng_list << ng_list_drug
  ng_list << ng_list_katakana
  ng_list.flatten!

  ng_list

end
