module SmplesHelper

  
#########    percent_position
#
#
#
#
#
def percent_position(percent_array)
  i=0
  dataPos=[0]
    while i < (percent_array.length-1)
    dataPos[i+1]=percent_array[0..i].sum
    i+=1
    end
  return dataPos
end




###########   height_position
#
#
#
#
#
def height_coordinates(record_relation)
  return_array=[]
  tmpArry=[]
  tmpHash = get_param_percentage(record_relation)
  tmpHash.each{|x,y| 
    return_array += y.values
    }
  return return_array
end




######## get_param_percentage
#
# goal here is to return a hash
#   where each par1 value
#  matches a hash with
#   a breakdown of the percentage of
#        par2 values
#
#
def get_param_percentage(record_relation)
  params=record_relation.map{|x| x.par1}.uniq
  return_hash = {}
  params.each{|p|
    tmpHash = {}
    tmpReltn = record_relation.where(par1: p)
    tmpParams = tmpReltn.map{|x| x.par2}.uniq
      tmpParams.each{|q|
            dubTmpReltn = tmpReltn.where(par2: q)
            tmpPerc = (dubTmpReltn.length.to_f/tmpReltn.length.to_f)*100
            tmpHash[q] = tmpPerc 
      }
    return_hash[p] = tmpHash
  }
  return return_hash
end




########get_stat_values
#
#
#
#
#
def get_stat_values(record_relation)
  return_array=[]
  params=record_relation.map{|x| x.par1}.uniq
  params.each{|p| 
    tmpReltn = record_relation.where('par1 == ' + p.to_s)
    return_array += [p,tmpReltn.map{|x|x.par2}.sum,tmpReltn.map{|x| x.par2}.length]
  }
  return return_array
end





######get_stat_avg
#    returns a hash showing
#       each par 1 value
#          with its average par 2
#             value
def get_stat_avg(record_relation)
  return_array=[]
  tmpArry=get_stat_values(record_relation)
  i=0
  ix=tmpArry.length/3
    while i < ix
    return_array += [tmpArry[i*3],tmpArry[i*3+1]/tmpArry[i*3+2]]
    i+=1
    end
  return_hash = Hash[return_array.each_slice(2).to_a]
  return return_hash
end
 





########get_y_coordinates
#
#   returns an array
#     of y coordinates
#
#
#
def get_y_coordinates(record_relation)
  return_array=[]
  tmpArry=[]
  tmpHash = get_param_percentage(record_relation)
  tmpHash.each{|x,y| 
    tmpArry = y.values
    return_array += percent_position(tmpArry)
    }
  return return_array
end



#######get_par2_legend
#
#   returns an array
#     with the names of par 2 values
#   in same order as get_y_coordinates
#
def get_par2_legend(record_relation)
  return_array=[]
  tmpArry=[]
  tmpHash = get_param_percentage(record_relation)
  tmpArry = tmpHash.keys
  tmpArry.each{|x| 
    return_array += tmpHash[x].keys
    }
  return return_array
end





def get_x_label(record_relation)
  return_array=[]
  tmpArry=[]
  tmpHash = get_param_percentage(record_relation)
  tmpArry = tmpHash.keys.sort
  tmpArry.each{|x| return_array.push(x.to_s)}
  return return_array
end


def get_x_label_pos(record_relation)
  return_array=[]
  tmpArry=[]
  tmpHash = get_param_percentage(record_relation)
  return_array = tmpHash.keys.sort
  return return_array
end


#########get_x_coordinates
#
#
#
#
#
#
def get_x_coordinates(record_relation)
  i=0
  tmpArry=[]
  return_array=[]
  someArry=[]
  tmpHash = get_param_percentage(record_relation)
  tmpArry=tmpHash.keys
  tmpArry.each{|x| someArry.push(tmpHash[x].length)}
    while i < tmpArry.length
    return_array += [tmpArry[i]]*someArry[i]
    i += 1
    end
  return return_array
end




#######set_class
#
#
#    returns array of class names
#       for each par 2 value
#     in same order as xcord and ycord
#
def set_class(record_relation)
  return_array=[]
  tmpArry=[]
  tmpHash = get_param_percentage(record_relation)
  tmpHash.each{|x,y| 
    tmpArry += y.keys
    }
  tmpArry.each{|x| return_array.push("par2"+x.to_s.gsub(/\.5/,'x5').gsub(/\.0/,'')
)}
  return return_array
end




def set_leg_label(record_relation)
  flotArry = []
return_array = []
  tmpArry = set_class(record_relation)
  tmpArry.each{|x| flotArry.push(x.gsub(/par2/,'').gsub(/x/,'.').to_f)}
  return_array = flotArry.uniq.sort.to_s 
  return return_array
end




def set_leg_class(record_relation)
  burnArry = []
  flotArry = []
return_array = []
  tmpArry = set_class(record_relation)
  tmpArry.each{|x| flotArry.push(x.gsub(/par2/,'').gsub(/x/,'.').to_f)}
  burnArry = flotArry.uniq.sort
  burnArry.each{|x| return_array.push("par2"+x.to_s.gsub(/\.5/,'x5').gsub(/\.0/,''))}
  return return_array
end






end
