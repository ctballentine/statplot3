module SmplesHelper

  

def percent_position(percent_array)
  i=0
  dataPos=[0]
    while i < (percent_array.length-1)
    dataPos[i+1]=percent_array[0..i].sum
    i+=1
    end
  return dataPos
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
    tmpReltn = record_relation.where('par1 == ' + p.to_s)
    tmpParams = tmpReltn.map{|x| x.par2}.uniq
      tmpParams.each{|q|
            dubTmpReltn = tmpReltn.where('par2 == ' + q.to_s)
            tmpPerc = (dubTmpReltn.length.to_f/tmpReltn.length.to_f)*100
            tmpHash[q] = tmpPerc 
      }
    return_hash[p] = tmpHash
  }
  return return_hash
end



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










end
